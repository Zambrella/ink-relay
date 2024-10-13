// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_profile_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistProfileImageHash() =>
    r'ea052312de17564b060164d5c8280d40304c26cf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [artistProfileImage].
@ProviderFor(artistProfileImage)
const artistProfileImageProvider = ArtistProfileImageFamily();

/// See also [artistProfileImage].
class ArtistProfileImageFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [artistProfileImage].
  const ArtistProfileImageFamily();

  /// See also [artistProfileImage].
  ArtistProfileImageProvider call(
    String imageId,
    int size,
  ) {
    return ArtistProfileImageProvider(
      imageId,
      size,
    );
  }

  @override
  ArtistProfileImageProvider getProviderOverride(
    covariant ArtistProfileImageProvider provider,
  ) {
    return call(
      provider.imageId,
      provider.size,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'artistProfileImageProvider';
}

/// See also [artistProfileImage].
class ArtistProfileImageProvider extends AutoDisposeFutureProvider<Uint8List> {
  /// See also [artistProfileImage].
  ArtistProfileImageProvider(
    String imageId,
    int size,
  ) : this._internal(
          (ref) => artistProfileImage(
            ref as ArtistProfileImageRef,
            imageId,
            size,
          ),
          from: artistProfileImageProvider,
          name: r'artistProfileImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artistProfileImageHash,
          dependencies: ArtistProfileImageFamily._dependencies,
          allTransitiveDependencies:
              ArtistProfileImageFamily._allTransitiveDependencies,
          imageId: imageId,
          size: size,
        );

  ArtistProfileImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageId,
    required this.size,
  }) : super.internal();

  final String imageId;
  final int size;

  @override
  Override overrideWith(
    FutureOr<Uint8List> Function(ArtistProfileImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistProfileImageProvider._internal(
        (ref) => create(ref as ArtistProfileImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageId: imageId,
        size: size,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Uint8List> createElement() {
    return _ArtistProfileImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistProfileImageProvider &&
        other.imageId == imageId &&
        other.size == size;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageId.hashCode);
    hash = _SystemHash.combine(hash, size.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArtistProfileImageRef on AutoDisposeFutureProviderRef<Uint8List> {
  /// The parameter `imageId` of this provider.
  String get imageId;

  /// The parameter `size` of this provider.
  int get size;
}

class _ArtistProfileImageProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List>
    with ArtistProfileImageRef {
  _ArtistProfileImageProviderElement(super.provider);

  @override
  String get imageId => (origin as ArtistProfileImageProvider).imageId;
  @override
  int get size => (origin as ArtistProfileImageProvider).size;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
