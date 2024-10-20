// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactDetailsPageControllerHash() =>
    r'279b71ed44d05d70a4cf74e0df59d6ab5ede38fa';

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

abstract class _$ContactDetailsPageController
    extends BuildlessAutoDisposeAsyncNotifier<Contact> {
  late final String contactId;

  FutureOr<Contact> build(
    String contactId,
  );
}

/// See also [ContactDetailsPageController].
@ProviderFor(ContactDetailsPageController)
const contactDetailsPageControllerProvider =
    ContactDetailsPageControllerFamily();

/// See also [ContactDetailsPageController].
class ContactDetailsPageControllerFamily extends Family<AsyncValue<Contact>> {
  /// See also [ContactDetailsPageController].
  const ContactDetailsPageControllerFamily();

  /// See also [ContactDetailsPageController].
  ContactDetailsPageControllerProvider call(
    String contactId,
  ) {
    return ContactDetailsPageControllerProvider(
      contactId,
    );
  }

  @override
  ContactDetailsPageControllerProvider getProviderOverride(
    covariant ContactDetailsPageControllerProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'contactDetailsPageControllerProvider';
}

/// See also [ContactDetailsPageController].
class ContactDetailsPageControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ContactDetailsPageController,
        Contact> {
  /// See also [ContactDetailsPageController].
  ContactDetailsPageControllerProvider(
    String contactId,
  ) : this._internal(
          () => ContactDetailsPageController()..contactId = contactId,
          from: contactDetailsPageControllerProvider,
          name: r'contactDetailsPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contactDetailsPageControllerHash,
          dependencies: ContactDetailsPageControllerFamily._dependencies,
          allTransitiveDependencies:
              ContactDetailsPageControllerFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  ContactDetailsPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final String contactId;

  @override
  FutureOr<Contact> runNotifierBuild(
    covariant ContactDetailsPageController notifier,
  ) {
    return notifier.build(
      contactId,
    );
  }

  @override
  Override overrideWith(ContactDetailsPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactDetailsPageControllerProvider._internal(
        () => create()..contactId = contactId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContactDetailsPageController, Contact>
      createElement() {
    return _ContactDetailsPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactDetailsPageControllerProvider &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ContactDetailsPageControllerRef
    on AutoDisposeAsyncNotifierProviderRef<Contact> {
  /// The parameter `contactId` of this provider.
  String get contactId;
}

class _ContactDetailsPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        ContactDetailsPageController,
        Contact> with ContactDetailsPageControllerRef {
  _ContactDetailsPageControllerProviderElement(super.provider);

  @override
  String get contactId =>
      (origin as ContactDetailsPageControllerProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
