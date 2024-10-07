import 'package:auth_core/src/auth_method.dart';

/// {@template app_user}
/// A class representing a user of the application.
/// {@endtemplate}
class AppUser {
  /// {@macro app_user}
  const AppUser({
    required this.id,
    required this.authMethod,
    this.email,
    this.name,
    this.photoUrl,
  });

  final String id;
  final AuthMethod authMethod;
  final String? email;
  final String? name;
  final String? photoUrl;
}
