import 'package:uuid/uuid.dart';

extension type Identifier(String id) {
  Identifier.newId() : this(const Uuid().v4());
}
