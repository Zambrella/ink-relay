import 'package:ink_relay/analytics/domain/analytics_facade.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_provider.g.dart';

@Riverpod(keepAlive: true)
AnalyticsFacade analytics(AnalyticsRef ref) {
  return AnalyticsFacade(ref.watch(analyticsRepositoryProvider));
}
