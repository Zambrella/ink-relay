import 'package:ink_relay/clients/domain/artist_client_service.abs.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/repository/contact_repository.dart';

class ContactServiceImpl implements ContactService {
  const ContactServiceImpl(this._contactRepository);

  final ContactRepository _contactRepository;

  @override
  Future<Contact> createContact(
    Contact contact,
    String artistId,
  ) {
    // TODO: implement createArtistClient
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getAllContacts(String artistId) async {
    final contactDtos = await _contactRepository.getAllContacts(artistId);
    final artistClients = contactDtos.map((dto) => dto.toDomain()).toList();
    return artistClients;
  }

  @override
  Future<Contact> getContact(String id) {
    // TODO: implement getArtistClient
    throw UnimplementedError();
  }

  @override
  Future<Contact> updateContact(
    Contact contact,
    String artistId,
  ) {
    // TODO: implement updateArtistClient
    throw UnimplementedError();
  }
}