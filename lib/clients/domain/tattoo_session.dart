import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/common/models.dart';

part 'tattoo_session.g.dart';

/// {@template tattoo_session}
/// A tattoo session is a scheduled appointment for a tattoo.
/// {@endtemplate}
@CopyWith()
class TattooSession extends Equatable {
  /// {@macro tattoo_session}
  const TattooSession({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.when,
    required this.duration,
    required this.status,
    this.notes,
  });

  /// The unique identifier for the tattoo session.
  final Identifier id;

  /// When the tattoo session was created.
  final DateTime createdAt;

  /// When the tattoo session was last updated.
  final DateTime updatedAt;

  /// When the start of the tattoo session is scheduled for.
  final DateTime when;

  /// The duration of the tattoo session.
  final Duration duration;

  /// The status of the tattoo session.
  // TODO: Update to enum
  final String status;

  /// The notes for the tattoo session.
  final String? notes;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        when,
        duration,
        status,
        notes,
      ];
}
