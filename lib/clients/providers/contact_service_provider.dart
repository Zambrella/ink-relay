import 'package:ink_relay/clients/domain/contact_service.abs.dart';
import 'package:ink_relay/clients/providers/contact_repository_provider.dart';
import 'package:ink_relay/clients/service/contact_service.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_service_provider.g.dart';

@Riverpod(keepAlive: true)
ContactService contactService(ContactServiceRef ref) {
  return ContactServiceImpl(ref.watch(contactRepositoryProvider));
}
