import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/providers/contact_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_list_provider.g.dart';

@riverpod
Future<List<Contact>> contactList(ContactListRef ref) async {
  final artistId = ref.watch(userArtistIdProvider);
  return ref.watch(contactServiceProvider).getAllContacts(artistId.id);
}
