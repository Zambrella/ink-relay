import 'package:flutter/material.dart';
import 'package:ink_relay/authentication/presentation/widgets/login_form.dart';
import 'package:ink_relay/theme/form_factor.dart';
import 'package:ink_relay/theme/theme_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          surfaceTintColor: context.theme.colorScheme.surfaceTint,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: FormFactor.mobile.breakpoint),
            child: Padding(
              padding: EdgeInsets.all(context.theme.appSpacing.veryLarge),
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
