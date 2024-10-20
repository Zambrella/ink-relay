import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/presentation/widgets/update_info_card.dart';
import 'package:ink_relay/clients/presentation/controllers/contact_details_page_controller.dart';
import 'package:ink_relay/theme/theme.dart';

class ContactDetailsPage extends ConsumerStatefulWidget {
  const ContactDetailsPage({
    required this.contactId,
    super.key,
  });

  final String contactId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactDetailsPageState();
}

class _ContactDetailsPageState extends ConsumerState<ContactDetailsPage> {
  String get contactId => widget.contactId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          ref
                  .watch(contactDetailsPageControllerProvider(contactId))
                  .valueOrNull
                  ?.name ??
              '',
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: FormFactor.tablet.breakpoint,
          ),
          child: switch (
              ref.watch(contactDetailsPageControllerProvider(contactId))) {
            AsyncData(valueOrNull: final contact) => ListView(
                children: [
                  UpdateInfoCard(
                    title: 'Client Name',
                    subtitle: 'The name of the client. Private to you.',
                    isLoading: false,
                    onSave: () async {
                      // if (!_nameFormFieldKey.currentState!.validate()) {
                      //   return;
                      // }
                      // await ref
                      //     .read(updateArtistNameControllerProvider.notifier)
                      //     .updateArtistName(_nameController.text.trim());
                    },
                    child: TextFormField(
                      // key: _nameFormFieldKey,
                      // controller: _nameController,
                      // enabled:
                      //     !ref.watch(updateArtistNameControllerProvider).isLoading,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text('Client Name'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      context.theme.appSpacing.large,
                    ),
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: context.theme.colorScheme.error,
                        foregroundColor: context.theme.colorScheme.onError,
                      ),
                      icon: Icon(Icons.delete),
                      label: Text('Delete Client'),
                      onPressed: () async {
                        // await ref
                        //     .read(deleteArtistControllerProvider.notifier)
                        //     .deleteArtist();
                      },
                    ),
                  ),
                ],
              ),
            AsyncError(error: final error) => Center(
                child: Column(
                  children: [
                    Text('An error occurred: $error'),
                  ],
                ),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
    );
  }
}
