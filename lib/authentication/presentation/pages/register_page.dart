import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/authentication/presentation/widgets/register_form.dart';
import 'package:ink_relay/theme/theme.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          surfaceTintColor: context.theme.colorScheme.surfaceTint,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: FormFactor.mobile.breakpoint),
            child: Padding(
              padding: EdgeInsets.all(context.theme.appSpacing.veryLarge),
              child: const RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}
