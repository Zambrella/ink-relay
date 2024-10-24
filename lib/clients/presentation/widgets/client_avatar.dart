import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/providers/contact_profile_image_provider.dart';
import 'package:ink_relay/theme/theme.dart';

class ClientAvatar extends ConsumerWidget {
  const ClientAvatar({
    required this.contact,
    required this.maxSize,
    super.key,
  });

  final Contact contact;
  final int maxSize;

  String get artistInitials {
    final name = contact.name;
    final initials = name.split(' ').map((e) => e[0].toUpperCase()).join();
    return initials;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      minRadius: 32,
      maxRadius: maxSize.toDouble(),
      foregroundImage: contact.profilePictureId != null
          ? ref
              .watch(
                contactProfileImageProvider(
                  contact.profilePictureId!,
                  maxSize * 2,
                ),
              )
              .whenOrNull(
                data: MemoryImage.new,
              )
          : null,
      child: Text(
        artistInitials,
        style: context.theme.textTheme.headlineSmall!.copyWith(
          color: context.theme.colorScheme.onSurface.withOpacity(0.7),
          fontSize: 32,
        ),
      ),
    );
  }
}
