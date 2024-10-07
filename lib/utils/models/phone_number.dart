extension type PhoneNumber(String phoneNumber) {
  PhoneNumber.fromParts({
    required int countryCode,
    required int remainingDigits,
  }) : phoneNumber = '+$countryCode$remainingDigits';
}
