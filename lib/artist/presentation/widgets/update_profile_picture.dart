import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/presentation/controllers/update_artist_profile_image_controller.dart';
import 'package:ink_relay/artist/presentation/widgets/artist_avatar.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/theme/theme.dart';
import 'package:toastification/toastification.dart';

// TODO: Add the ability to crop the image before uploading it.
// TODO: Delete old profile picture after uploading a new one.

class UpdateProfilePicture extends ConsumerStatefulWidget {
  const UpdateProfilePicture({
    required this.artist,
    super.key,
  });

  final Artist artist;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProfilePictureState();
}

class _UpdateProfilePictureState extends ConsumerState<UpdateProfilePicture> {
  Artist get artist => widget.artist;

  String get artistInitials {
    final name = artist.name;
    final initials = name.split(' ').map((e) => e[0].toUpperCase()).join();
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(updateArtistProfileImageControllerProvider, (prev, state) {
      if (prev != null && prev.isLoading && state is AsyncData) {
        toastification.showSuccess(
          context: context,
          message: 'Photo uploaded',
        );
      }

      if (state is AsyncError) {
        toastification.showError(
          context: context,
          message: state.error.errorMessage(context),
        );
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ArtistAvatar(
          artist: artist,
          maxSize: 72,
        ),
        SizedBox(height: context.theme.appSpacing.small),
        LoadingButton(
          label: 'Upload photo',
          icon: Icons.upload,
          isLoading:
              ref.watch(updateArtistProfileImageControllerProvider).isLoading,
          onPressed: () async {
            await ref
                .read(updateArtistProfileImageControllerProvider.notifier)
                .updateArtistProfileImage();
          },
        ),
      ],
    );
  }
}
