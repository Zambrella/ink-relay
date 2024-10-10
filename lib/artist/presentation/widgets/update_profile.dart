import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/presentation/controllers/update_artist_contact_email_controller.dart';
import 'package:ink_relay/artist/presentation/controllers/update_artist_name_controller.dart';
import 'package:ink_relay/artist/presentation/widgets/update_info_card.dart';
import 'package:ink_relay/artist/presentation/widgets/update_profile_picture.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';

import 'package:ink_relay/theme/theme.dart';
import 'package:toastification/toastification.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({required this.artist, super.key});

  final Artist artist;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  Artist get artist => widget.artist;

  final _nameFormFieldKey = GlobalKey<FormFieldState<String>>();
  final _emailFormFieldKey = GlobalKey<FormFieldState<String>>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: artist.name);
    _emailController = TextEditingController();
    if (artist.email != null) {
      _emailController.text = artist.email.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(updateArtistNameControllerProvider, (prev, state) {
      if (prev != null && prev.isLoading && state is AsyncData) {
        toastification.showSuccess(
          context: context,
          message: 'Name updated successfully',
        );
      }

      if (state is AsyncError) {
        toastification.showError(
          context: context,
          message: state.error.errorMessage(context),
        );
      }
    });

    // ignore: cascade_invocations
    ref.listen(updateArtistContactEmailControllerProvider, (prev, state) {
      if (prev != null && prev.isLoading && state is AsyncData) {
        toastification.showSuccess(
          context: context,
          message: 'Name updated successfully',
        );
      }

      if (state is AsyncError) {
        toastification.showError(
          context: context,
          message: state.error.errorMessage(context),
        );
      }
    });

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: FormFactor.tablet.breakpoint,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.theme.appSpacing.large),
            UpdateProfilePicture(artist: artist),
            UpdateInfoCard(
              title: 'Name',
              subtitle:
                  'This is the name that will be displayed on your profile.',
              isLoading:
                  ref.watch(updateArtistNameControllerProvider).isLoading,
              onSave: () async {
                if (!_nameFormFieldKey.currentState!.validate()) {
                  return;
                }
                await ref
                    .read(updateArtistNameControllerProvider.notifier)
                    .updateArtistName(_nameController.text.trim());
              },
              child: TextFormField(
                key: _nameFormFieldKey,
                controller: _nameController,
                enabled:
                    !ref.watch(updateArtistNameControllerProvider).isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Your Name'),
                ),
              ),
            ),
            UpdateInfoCard(
              title: 'Contact Email',
              subtitle:
                  'This is the email that will be displayed on your profile.',
              isLoading: ref
                  .watch(updateArtistContactEmailControllerProvider)
                  .isLoading,
              onSave: () async {
                if (!_emailFormFieldKey.currentState!.validate()) {
                  return;
                }
                await ref
                    .read(updateArtistContactEmailControllerProvider.notifier)
                    .updateArtistContactEmail(_emailController.text.trim());
              },
              child: TextFormField(
                key: _emailFormFieldKey,
                controller: _emailController,
                enabled: !ref
                    .watch(updateArtistContactEmailControllerProvider)
                    .isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Invalid email address';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
