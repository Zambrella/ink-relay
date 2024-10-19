import 'package:ink_relay/sessions/domain/tattoo_session_service.abs.dart';
import 'package:ink_relay/sessions/providers/tattoo_session_repository_provider.dart';
import 'package:ink_relay/sessions/service/tattoo_session_service.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tattoo_session_service_provider.g.dart';

@Riverpod(keepAlive: true)
TattooSessionService tattooSessionService(TattooSessionServiceRef ref) {
  return TattooSessionServiceImpl(ref.watch(tattooSessionRepositoryProvider));
}
