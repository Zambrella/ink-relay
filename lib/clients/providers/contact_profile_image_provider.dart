import 'package:appwrite/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:ink_relay/common/appwrite_ids.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_profile_image_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<Uint8List> contactProfileImage(
  ContactProfileImageRef ref,
  String imageId,
  int size,
) async {
  final storage = ref.watch(appwriteStorageClientProvider);
  final bytes = await storage.getFilePreview(
    bucketId: AppwriteIds.contactPictureStorageId,
    fileId: imageId,
    width: size,
    height: 0,
    gravity: ImageGravity.center,
  );
  return bytes;
}
