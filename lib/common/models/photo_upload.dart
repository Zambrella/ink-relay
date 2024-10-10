import 'package:flutter/foundation.dart';

/// {@template photo_upload}
/// A representation of a photo to upload.
/// {@endtemplate}
@immutable
class PhotoUpload {
  /// {@macro photo_upload}
  const PhotoUpload({
    required this.fileName,
    required this.fileBytes,
    this.mimeType = 'image/jpeg',
  });

  /// The name of the file that contains the photo.
  final String fileName;

  /// The bytes of the photo.
  final Uint8List fileBytes;

  /// The MIME type of the photo.
  /// Defaults to 'image/jpeg' as it is the most common type for
  /// photos.
  final String mimeType;
}
