import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/common/widgets/loading_button.dart';
import 'package:ink_relay/theme/theme.dart';

/// {@template update_info_card}
/// A card that has a [title] and optional [subtitle] displayed on
/// the left side and a [child] widget displayed on the right side.
/// A save button is displayed below the [child] widget.
/// {@endtemplate}
class UpdateInfoCard extends ConsumerWidget {
  /// {@macro update_info_card}
  const UpdateInfoCard({
    required this.title,
    required this.isLoading,
    required this.onSave,
    required this.child,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final bool isLoading;
  final VoidCallback onSave;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.theme.appSpacing.large,
        left: context.theme.appSpacing.large,
        right: context.theme.appSpacing.large,
      ),
      child: Card(
        elevation: 0,
        surfaceTintColor: context.theme.colorScheme.surfaceTint,
        color: context.theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.theme.colorScheme.secondaryContainer,
          ),
          borderRadius: BorderRadius.circular(
            context.theme.appRadius.small,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.theme.appSpacing.large),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.theme.textTheme.titleLarge,
                        ),
                        if (subtitle != null)
                          SizedBox(height: context.theme.appSpacing.small),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: context.theme.textTheme.bodyMedium!.copyWith(
                              color: context.theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: context.theme.appSpacing.large),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
              SizedBox(height: context.theme.appSpacing.large),
              Align(
                alignment: Alignment.centerRight,
                child: LoadingButton(
                  label: 'Save',
                  icon: Icons.save,
                  isLoading: isLoading,
                  onPressed: onSave,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
