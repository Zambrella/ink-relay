import 'package:image_picker/image_picker.dart';
import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/common/models/photo_upload.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_artist_profile_image_controller.g.dart';

@riverpod
class UpdateArtistProfileImageController
    extends _$UpdateArtistProfileImageController {
  @override
  FutureOr<void> build() {}

  Future<void> updateArtistProfileImage() async {
    state = const AsyncLoading();
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        state = const AsyncData(null);
        return;
      }
      final upload = PhotoUpload(
        fileBytes: await image.readAsBytes(),
        fileName: image.name,
        mimeType: image.mimeType ?? 'image/jpeg',
      );
      final fileId = await ref
          .read(artistServiceProvider)
          .uploadUserArtistProfilePicture(upload);
      final updatedArtist = ref
          .read(userArtistProvider)
          .requireValue
          .updateProfilePictureId(fileId);
      final _ =
          await ref.read(artistServiceProvider).updateUserArtist(updatedArtist);
      ref.invalidate(userArtistProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
