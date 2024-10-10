import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/authentication/presentation/controllers/login_controller.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme_extensions.dart';
import 'package:toastification/toastification.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _loginPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      await ref.read(loginControllerProvider.notifier).login(
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
    ref.listen(loginControllerProvider, (prev, next) {
      if (next is AsyncData) {
        toastification.showSuccess(
          context: context,
          message: 'Login successful',
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
            'Login',
            style: context.theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.theme.appSpacing.small),
          Text(
            'Welcome back!',
            style: context.theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.theme.appSpacing.veryLarge),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (_) async {
              await _loginPressed();
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
            enabled: !ref.watch(loginControllerProvider).isLoading,
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
              await _loginPressed();
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
            enabled: !ref.watch(loginControllerProvider).isLoading,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(height: context.theme.appSpacing.small),
          InkWell(
            onTap: () {
              // TODO: Implement forgot password
            },
            child: Text(
              'Forgot password?',
              style: context.theme.textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(height: context.theme.appSpacing.veryLarge),
          LoadingButton(
            label: 'Login',
            icon: Icons.login,
            isLoading: ref.watch(loginControllerProvider).isLoading,
            onPressed: () async {
              await _loginPressed();
            },
          ),
          SizedBox(height: context.theme.appSpacing.large),
        ],
      ),
    );
  }
}
