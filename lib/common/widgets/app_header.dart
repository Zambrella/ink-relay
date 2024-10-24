import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/app_dependencies.dart';
import 'package:ink_relay/app_exception.dart';
import 'package:ink_relay/artist/presentation/widgets/artist_avatar.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/authentication/presentation/controllers/logout_controller.dart';
import 'package:ink_relay/common/extensions/toastification_extensions.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme.dart';
import 'package:toastification/toastification.dart';

class AppHeader extends ConsumerStatefulWidget {
  const AppHeader({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppHeaderState();
}

class _AppHeaderState extends ConsumerState<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: context.theme.appSpacing.medium,
                  ),
                  child: Text(
                    'INK RELAY',
                    style: context.theme.textTheme.headlineSmall?.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                ),
                const Spacer(),
                const ProfileMenu(),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: context.theme.colorScheme.secondaryContainer,
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}

class ProfileMenu extends ConsumerStatefulWidget {
  const ProfileMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends ConsumerState<ProfileMenu> {
  late final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(logoutControllerProvider, (prev, state) {
      if (prev is AsyncLoading && state is AsyncData) {
        ref.read(loggerProvider).i('User logged out successfully');
        toastification.showSuccess(
          context: context,
          message: 'Logged out.',
        );
        GoRouter.of(context).clearStackAndNavigate('/login');
      } else if (prev is AsyncLoading && state is AsyncError) {
        ref.read(loggerProvider).e(
              'Failed to log out',
              error: state.error,
              stackTrace: state.stackTrace,
            );
        toastification.showError(
          context: context,
          message: state.error.errorMessage(context),
        );
      }
    });

    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      style: const MenuStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.person),
          onPressed: () {
            context.pushNamed(AppRoute.profile.name);
          },
          child: const Text('Profile'),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.settings),
          onPressed: () {},
          child: const Text('Settings'),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.logout),
          onPressed: () async {
            await ref.read(logoutControllerProvider.notifier).logout();
          },
          child: const Text('Logout'),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.all(context.theme.appSpacing.small),
          child: const SetThemeButton(),
        ),
      ],
      builder: (context, MenuController controller, Widget? child) {
        return switch (ref.watch(userArtistProvider)) {
          AsyncData(valueOrNull: final artist?) => InkWell(
              focusNode: _buttonFocusNode,
              onTap: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.theme.appSpacing.small,
                  horizontal: context.theme.appSpacing.large,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ArtistAvatar(
                      artist: artist,
                      maxSize: 32,
                    ),
                    SizedBox(width: context.theme.appSpacing.small),
                    Text(artist.name),
                    SizedBox(width: context.theme.appSpacing.small),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          _ => const Center(
              child: CircularProgressIndicator(),
            ), // TOOD: Replace with cool shimmer
        };
      },
    );
  }
}

class SetThemeButton extends ConsumerStatefulWidget {
  const SetThemeButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SetThemeButtonState();
}

class _SetThemeButtonState extends ConsumerState<SetThemeButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(selectedThemeProvider);
    return switch (themeProvider) {
      AsyncData<ThemeMode>(valueOrNull: final themeMode?) =>
        SegmentedButton<ThemeMode>(
          segments: ThemeMode.values.map(
            (mode) {
              return ButtonSegment<ThemeMode>(
                value: mode,
                label: Text(mode.name),
                icon: Icon(mode.icon),
                tooltip: 'Switch to ${mode.name} theme',
              );
            },
          ).toList(),
          selected: {themeMode},
          selectedIcon: Icon(themeMode.icon),
          onSelectionChanged: (selected) {
            ref
                .read(selectedThemeProvider.notifier)
                .setThemeMode(selected.first);
          },
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

extension ThemeModeX on ThemeMode {
  String get name {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  IconData get icon {
    switch (this) {
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return Icons.brightness_high;
      case ThemeMode.dark:
        return Icons.brightness_3;
    }
  }
}
