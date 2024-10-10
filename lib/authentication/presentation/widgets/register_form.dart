import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/authentication/presentation/controllers/register_controller.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme_extensions.dart';
import 'package:toastification/toastification.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _registerPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      await ref.read(registerControllerProvider.notifier).register(
            email,
            password,
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerControllerProvider, (prev, next) {
      if (next is AsyncData) {
        toastification.showSuccess(
          context: context,
          message: 'Registration successful.',
        );
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

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
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
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (_) async {
              await _registerPressed();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              }
              final isValid = EmailValidator.validate(value);
              if (!isValid) {
                return 'Invalid email';
              }
              return null;
            },
            enabled: !ref.watch(registerControllerProvider).isLoading,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(height: context.theme.appSpacing.medium),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (_) async {
              await _registerPressed();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              if (value.length < 6) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
            enabled: !ref.watch(registerControllerProvider).isLoading,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(height: context.theme.appSpacing.veryLarge),
          LoadingButton(
            label: 'Register',
            icon: Icons.person_add,
            isLoading: ref.watch(registerControllerProvider).isLoading,
            onPressed: () async {
              await _registerPressed();
            },
          ),
          SizedBox(height: context.theme.appSpacing.small),
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'By registering, you agree to our ',
              style: context.theme.textTheme.bodySmall,
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: context.theme.colorScheme.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: Add terms of service link
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: context.theme.colorScheme.primary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO: Add privacy policy link
                    },
                ),
              ],
            ),
          ),
          SizedBox(height: context.theme.appSpacing.large),
          InkWell(
            onTap: () {
              context.goNamed(AppRoute.login.name);
            },
            child: RichText(
              textScaler: MediaQuery.of(context).textScaler,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: context.theme.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Login.',
                    style: TextStyle(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
