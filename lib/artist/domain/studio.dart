import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/utils/models/identifier.dart';

part 'studio.g.dart';

@CopyWith()
class Studio implements Equatable {
  const Studio({
    required this.id,
    required this.name,
    required this.address,
  });

  final Identifier id;
  final String name;
  // TODO: Replace this with an actual address class
  final String address;

  @override
  List<Object?> get props => [id, name, address];

  @override
  bool? get stringify => true;
}
