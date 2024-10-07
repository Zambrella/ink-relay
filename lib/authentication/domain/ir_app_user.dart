import 'package:auth_core/auth_core.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'ir_app_user.g.dart';

@CopyWith()
class IrAppUser extends AppUser implements Equatable {
  const IrAppUser({
    required super.id,
    required super.authMethod,
    super.email,
    super.name,
    this.labels = const [],
  });

  final List<String> labels;

  @override
  List<Object?> get props => [
        super.id,
        super.authMethod,
        super.email,
        super.name,
        labels,
      ];

  @override
  bool? get stringify => true;
}
