import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ink_relay/artist/presentation/widgets/update_info_card.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/clients/presentation/controllers/contact_details_page_controller.dart';
import 'package:ink_relay/clients/presentation/controllers/update_contact_name_controller.dart';
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
            AsyncData(valueOrNull: final contact?) => ContactDetailsContent(
                contact: contact,
              ),
            AsyncError(error: final error) => Center(
                child: Column(
                  children: [
                    Text('Error loading client: $error'),
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

class ContactDetailsContent extends ConsumerStatefulWidget {
  const ContactDetailsContent({
    required this.contact,
    super.key,
  });

  final Contact contact;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactDetailsContentState();
}

class _ContactDetailsContentState extends ConsumerState<ContactDetailsContent> {
  Contact get contact => widget.contact;

  final _formKey = GlobalKey<FormBuilderState>();

  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: contact.name);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UpdateInfoCard(
          title: 'Client Name',
          subtitle: 'The name of the client. Private to you.',
          isLoading: ref.watch(updateContactNameControllerProvider).isLoading,
          onSave: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            await ref
                .read(updateContactNameControllerProvider.notifier)
                .updateContactName(
                  contact,
                  _nameController.text.trim(),
                );
          },
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  controller: _nameController,
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                    ],
                  ),
                ),
              ],
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
    );
  }
}
