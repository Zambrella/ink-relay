import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/authentication/presentation/controllers/register_controller.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prev, next) {
      if (next is AsyncData) {
        // print('User registered');
        context.goNamed(AppRoute.home.name);
      }

      if (next is AsyncLoading) {
        // print('Loading...');
      }

      if (next is AsyncError) {
        toastification.showError(
            context: context, message: next.error.errorMessage(context));
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await ref.read(registerControllerProvider.notifier).register();
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.register.name);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
