import 'package:appwrite/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:ink_relay/common/appwrite_ids.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_profile_image_provider.g.dart';

@riverpod
FutureOr<Uint8List> artistProfileImage(
  ArtistProfileImageRef ref,
  String imageId,
  int size,
) async {
  final storage = ref.watch(appwriteStorageClientProvider);
  final bytes = await storage.getFilePreview(
    bucketId: AppwriteIds.profilePictureStorageId,
    fileId: imageId,
    width: size,
    height: 0,
    gravity: ImageGravity.center,
  );
  return bytes;
}
