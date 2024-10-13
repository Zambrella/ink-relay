import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/providers/artist_profile_image_provider.dart';
import 'package:ink_relay/theme/theme.dart';

class ArtistAvatar extends ConsumerWidget {
  const ArtistAvatar({
    required this.artist,
    required this.maxSize,
    super.key,
  });

  final Artist artist;
  final int maxSize;

  String get artistInitials {
    final name = artist.name;
    final initials = name.split(' ').map((e) => e[0].toUpperCase()).join();
    return initials;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleAvatar(
      minRadius: 32,
      maxRadius: maxSize.toDouble(),
      foregroundImage: artist.profilePictureId != null
          ? ref
              .watch(
                artistProfileImageProvider(
                  artist.profilePictureId!,
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
