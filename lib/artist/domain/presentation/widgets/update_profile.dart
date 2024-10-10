import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/domain/presentation/widgets/update_info_card.dart';
import 'package:ink_relay/artist/domain/presentation/widgets/update_profile_picture.dart';
import 'package:ink_relay/theme/form_factor.dart';
import 'package:ink_relay/theme/theme.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends ConsumerState<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: FormFactor.tablet.breakpoint,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.theme.appSpacing.large),
            UpdateProfilePicture(),
            UpdateInfoCard(
              title: 'Name',
              subtitle:
                  'This is the name that will be displayed on your profile.',
              isLoading: false,
              onSave: () {},
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  label: Text('Your Name'),
                ),
              ),
            ),
            UpdateInfoCard(
              title: 'Contact Email',
              subtitle:
                  'This is the email that will be displayed on your profile.',
              isLoading: false,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  label: Text('Email'),
                ),
              ),
              onSave: () {},
            ),
          ],
        ),
      ),
    );
  }
}
