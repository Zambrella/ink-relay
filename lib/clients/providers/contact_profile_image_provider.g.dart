// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_profile_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactProfileImageHash() =>
    r'96b601dc929baeb2f795be88e75eedfcebc23112';

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

/// See also [contactProfileImage].
@ProviderFor(contactProfileImage)
const contactProfileImageProvider = ContactProfileImageFamily();

/// See also [contactProfileImage].
class ContactProfileImageFamily extends Family<AsyncValue<Uint8List>> {
  /// See also [contactProfileImage].
  const ContactProfileImageFamily();

  /// See also [contactProfileImage].
  ContactProfileImageProvider call(
    String imageId,
    int size,
  ) {
    return ContactProfileImageProvider(
      imageId,
      size,
    );
  }

  @override
  ContactProfileImageProvider getProviderOverride(
    covariant ContactProfileImageProvider provider,
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
  String? get name => r'contactProfileImageProvider';
}

/// See also [contactProfileImage].
class ContactProfileImageProvider extends FutureProvider<Uint8List> {
  /// See also [contactProfileImage].
  ContactProfileImageProvider(
    String imageId,
    int size,
  ) : this._internal(
          (ref) => contactProfileImage(
            ref as ContactProfileImageRef,
            imageId,
            size,
          ),
          from: contactProfileImageProvider,
          name: r'contactProfileImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactProfileImageHash,
          dependencies: ContactProfileImageFamily._dependencies,
          allTransitiveDependencies:
              ContactProfileImageFamily._allTransitiveDependencies,
          imageId: imageId,
          size: size,
        );

  ContactProfileImageProvider._internal(
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
    FutureOr<Uint8List> Function(ContactProfileImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ContactProfileImageProvider._internal(
        (ref) => create(ref as ContactProfileImageRef),
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
  FutureProviderElement<Uint8List> createElement() {
    return _ContactProfileImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactProfileImageProvider &&
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

mixin ContactProfileImageRef on FutureProviderRef<Uint8List> {
  /// The parameter `imageId` of this provider.
  String get imageId;

  /// The parameter `size` of this provider.
  int get size;
}

class _ContactProfileImageProviderElement
    extends FutureProviderElement<Uint8List> with ContactProfileImageRef {
  _ContactProfileImageProviderElement(super.provider);

  @override
  String get imageId => (origin as ContactProfileImageProvider).imageId;
  @override
  int get size => (origin as ContactProfileImageProvider).size;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
