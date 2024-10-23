import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/presentation/controllers/contact_details_page_controller.dart';
import 'package:ink_relay/clients/providers/contact_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_contact_name_controller.g.dart';

@riverpod
class UpdateContactNameController extends _$UpdateContactNameController {
  @override
  FutureOr<void> build() {}

  Future<void> updateContactName(Contact contact, String newName) async {
    state = const AsyncLoading();
    try {
      final newContact = contact.updateName(newName);
      final _ = await ref.read(contactServiceProvider).updateContact(
            newContact,
          );
      // This probably isn't necessary.
      ref.invalidate(
        contactDetailsPageControllerProvider(contact.id.toString()),
      );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
