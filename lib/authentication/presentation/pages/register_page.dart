import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/authentication/presentation/controllers/register_controller.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme.dart';
import 'package:toastification/toastification.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prev, next) {
      if (next is AsyncData) {
        // print('User registered');
        context.goNamed(AppRoute.calendar.name);
      }

      if (next is AsyncLoading) {
        // print('Loading...');
      }

      if (next is AsyncError) {
        toastification.showError(
          context: context,
          message: next.error.errorMessage(context),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          surfaceTintColor: context.theme.colorScheme.surfaceTint,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: FormFactor.mobile.breakpoint),
            child: Padding(
              padding: EdgeInsets.all(context.theme.appSpacing.veryLarge),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 75,
                        width: 75,
                        child: Placeholder(),
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    Text(
                      'Register',
                      style: context.theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.theme.appSpacing.small),
                    Text(
                      'Create an account to get started managing your clients and feel happier.',
                      style: context.theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.theme.appSpacing.veryLarge),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      enabled: !ref.watch(registerControllerProvider).isLoading,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.medium),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      enabled: !ref.watch(registerControllerProvider).isLoading,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                    ),
                    SizedBox(height: context.theme.appSpacing.veryLarge),
                    LoadingButton(
                      label: 'Register',
                      icon: Icons.person_add,
                      isLoading:
                          ref.watch(registerControllerProvider).isLoading,
                      onPressed: () async {
                        await ref
                            .read(registerControllerProvider.notifier)
                            .register();
                      },
                    ),
                    SizedBox(height: context.theme.appSpacing.veryLarge),
                    Text('Already have an account? Login.'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
