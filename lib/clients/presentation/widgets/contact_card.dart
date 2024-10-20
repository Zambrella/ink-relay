import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme.dart';

class ContactCard extends ConsumerStatefulWidget {
  const ContactCard({
    required this.contact,
    super.key,
  });

  final Contact contact;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends ConsumerState<ContactCard> {
  Contact get contact => widget.contact;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: FormFactor.tablet.breakpoint,
      ),
      child: Padding(
        padding: EdgeInsets.all(context.theme.appSpacing.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              contact.name,
              style: context.theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Text('Created: ${contact.createdAt}'),
            FilledButton.icon(
              onPressed: () {
                // Pop the modal
                Navigator.of(context).pop();
                context.pushNamed(
                  AppRoute.clientDetails.name,
                  pathParameters: {
                    'clientId': contact.id.id,
                  },
                );
              },
              icon: Icon(Icons.edit),
              label: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
