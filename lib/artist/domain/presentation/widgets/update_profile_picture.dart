import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/theme/theme.dart';

class UpdateProfilePicture extends ConsumerStatefulWidget {
  const UpdateProfilePicture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProfilePictureState();
}

class _UpdateProfilePictureState extends ConsumerState<UpdateProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          minRadius: 32,
          maxRadius: 72,
          child: Text(
            'JD',
            style: context.theme.textTheme.headlineSmall!.copyWith(
              color: context.theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 32,
            ),
          ),
        ),
        SizedBox(height: context.theme.appSpacing.small),
        LoadingButton(
          label: 'Upload photo',
          icon: Icons.upload,
          isLoading: false,
          onPressed: () {},
        ),
      ],
    );
  }
}
