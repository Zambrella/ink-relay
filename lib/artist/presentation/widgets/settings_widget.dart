import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/presentation/pages/instagram_login_page.dart';
import 'package:ink_relay/theme/theme.dart';

class SettingsWidget extends ConsumerStatefulWidget {
  const SettingsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends ConsumerState<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: FormFactor.tablet.breakpoint,
        ),
        child: Column(
          children: [
            SizedBox(height: context.theme.appSpacing.large),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const InstagramLoginPage(),
                  ),
                );
              },
              icon: Icon(Icons.security),
              label: Text('Authorize Instagram'),
            ),
          ],
        ),
      ),
    );
  }
}
