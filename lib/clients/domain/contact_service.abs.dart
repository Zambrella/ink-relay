import 'package:ink_relay/clients/domain/contact.dart';

/// Defines methods that the `Contact` service must implement
/// based on the business logic of the application.
abstract class ContactService {
  /// Get all [Contact]s that belong to the current user/Aritst.
  Future<List<Contact>> getAllContacts(String artistId);

  /// Get a [Contact] by its [id].
  Future<Contact> getContact(String id);

  /// Create a new [Contact].
  /// [artistId] is required to associate the [Contact] with the current user/Artist.
  Future<Contact> createContact(
    Contact contact,
    String artistId,
  );

  /// Update an existing [Contact].
  Future<Contact> updateContact(
    Contact contact,
  );
}
