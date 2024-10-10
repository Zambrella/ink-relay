import 'package:email_validator/email_validator.dart';

extension type ContactEmail(String email) {
  ContactEmail.fromParts({
    required String name,
    required String domain,
    required String tld,
  }) : email = '$name@$domain.$tld';

  // TODO: Replace this with a more robust email validation
  bool get isValid => EmailValidator.validate(email);
}
