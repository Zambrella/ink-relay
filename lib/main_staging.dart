import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ink_relay/bootstrap.dart';
import 'package:ink_relay/flavors.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      await bootstrap(Flavor.staging, binding);
    },
    (Object error, StackTrace? stack) {
      //* Add any additional error handling logic here. E.g. Log to Crashlytics
      log(
        'runZonedGuarded: Caught error: $error',
        time: DateTime.now(),
        name: 'main',
        error: error,
        stackTrace: stack,
      );
    },
  );
}
