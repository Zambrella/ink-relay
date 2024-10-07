import 'package:flutter/material.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.calendar.name);
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.register.name);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
