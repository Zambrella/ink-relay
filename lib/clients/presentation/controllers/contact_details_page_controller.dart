import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/providers/contact_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_details_page_controller.g.dart';

@riverpod
class ContactDetailsPageController extends _$ContactDetailsPageController {
  @override
  Future<Contact> build(String contactId) async {
    final contact =
        await ref.watch(contactServiceProvider).getContact(contactId);
    return contact;
  }

  // Add methods to mutate the state
}
