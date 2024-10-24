import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/presentation/widgets/client_avatar.dart';
import 'package:ink_relay/routing/app_router.dart';
import 'package:ink_relay/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ContactCardWidget {
  const ContactCardWidget._();

  static WoltModalSheetPage build(BuildContext context, Contact contact) {
    return WoltModalSheetPage(
      trailingNavBarWidget: Padding(
        padding: EdgeInsets.all(context.theme.appSpacing.medium),
        child: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Close',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      topBarTitle: Text(
        contact.name,
        style: context.theme.textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      pageTitle: Padding(
        padding: EdgeInsets.all(context.theme.appSpacing.large),
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(context.theme.appSpacing.veryLarge),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClientAvatar(
                          contact: contact,
                          maxSize: 32,
                        ),
                        SizedBox(width: context.theme.appSpacing.small),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contact.name,
                              style: context.theme.textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              DateFormat('d MMMM, yyyy')
                                  .format(contact.createdAt),
                            ),
                            Text('test@test.com'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
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
                  tooltip: 'Edit contact',
                  icon: Icon(Icons.edit),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.theme.appSpacing.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month),
                SizedBox(width: context.theme.appSpacing.small),
                Text(
                  'Upcoming Sessions',
                  style: context.theme.textTheme.titleLarge,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    WoltModalSheet.of(context).showNext();
                  },
                  child: Text(
                    'View all',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: List.generate(
                5,
                (index) => ListTile(
                  title: Text('Session $index'),
                  subtitle: Text('Session $index subtitle'),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: context.theme.appSpacing.medium),
            Row(
              children: [
                const Icon(Icons.bar_chart),
                SizedBox(width: context.theme.appSpacing.small),
                Text(
                  'Projects',
                  style: context.theme.textTheme.titleLarge,
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'View all',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const Divider(),
            Column(
              children: List.generate(
                5,
                (index) => ListTile(
                  title: Text('Project $index'),
                  subtitle: Text('Project $index subtitle'),
                  onTap: () {
                    // context.pushNamed(
                    //   AppRoute.projectDetails.name,
                    //   pathParameters: {
                    //     'projectId': index.toString(),
                    //   },
                    // );
                  },
                ),
              ),
            ),
            SizedBox(height: context.theme.appSpacing.medium),
            Row(
              children: [
                const Icon(Icons.message),
                SizedBox(width: context.theme.appSpacing.small),
                Text(
                  'Messages',
                  style: context.theme.textTheme.titleLarge,
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'View all',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
