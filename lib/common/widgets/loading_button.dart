import 'package:flutter/material.dart';
import 'package:ink_relay/theme/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.label,
    required this.icon,
    required this.isLoading,
    required this.onPressed,
    super.key,
  });

  final String label;
  final IconData? icon;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2),
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: context.theme.colorScheme.onPrimary,
              ),
            )
          : Icon(icon),
      label: Text(label),
    );
  }
}
