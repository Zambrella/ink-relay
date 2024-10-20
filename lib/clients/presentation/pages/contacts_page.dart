import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/clients/presentation/widgets/contact_card.dart';
import 'package:ink_relay/clients/providers/contact_list_provider.dart';
import 'package:ink_relay/theme/theme.dart';
import 'package:intl/intl.dart';

class ContactsPage extends ConsumerStatefulWidget {
  const ContactsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactsPageState();
}

class _ContactsPageState extends ConsumerState<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        scrolledUnderElevation: 0,
      ),
      body: switch (ref.watch(contactListProvider)) {
        AsyncData(valueOrNull: final contacts?) => Padding(
            padding: EdgeInsets.all(context.theme.appSpacing.large),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('${contacts.length} clients'),
                    Spacer(),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 500,
                        minWidth: 300,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.theme.appSpacing.small),
                Expanded(
                  child: DataTable2(
                    columnSpacing: context.theme.appSpacing.large,
                    horizontalMargin: context.theme.appSpacing.large,
                    minWidth: 600,
                    headingRowColor: WidgetStatePropertyAll(
                      context.theme.colorScheme.surfaceContainerHighest,
                    ),
                    headingTextStyle:
                        context.theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    showHeadingCheckBox: false,
                    columns: [
                      DataColumn2(
                        label: SizedBox.shrink(),
                        fixedWidth: 50,
                      ),
                      DataColumn2(
                        label: Text('Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn(
                        label: Text('First Seen'),
                      ),
                      DataColumn(
                        label: Text('Last activity'),
                        tooltip:
                            'When the client last messaged or was in the studio.',
                        onSort: (columnIndex, ascending) {
                          print('Column $columnIndex was clicked');
                        },
                      ),
                      DataColumn(
                        label: Text('Next session'),
                      ),
                    ],
                    rows: contacts.indexed.map<DataRow>(
                      (e) {
                        final (index, contact) = e;
                        return DataRow2(
                          onSelectChanged: (value) {
                            // Only when the checkbox is clicked
                            print('Selected: $value');
                          },
                          onTap: () async {
                            await showDialog<void>(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: ContactCard(contact: contact),
                                );
                              },
                            );
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(),
                            ),
                            DataCell(
                              Text(
                                contact.name,
                              ),
                            ),
                            // TODO: If it was less than 24 hours ago, show e.g. "23 hours ago"
                            DataCell(
                              Text(
                                DateFormat('d MMMM, yyyy')
                                    .format(contact.inquiredAt),
                              ),
                            ),
                            // TODO: If it was less than 24 hours ago, show e.g. "23 hours ago"
                            DataCell(
                              Text(
                                DateFormat('d MMMM, yyyy')
                                    .format(contact.updatedAt),
                              ),
                            ),
                            DataCell(
                              placeholder: true,
                              Text('-'),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        AsyncError(error: final error) => Center(
            child: Text('Error: $error'),
          ),
        _ => const Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }
}
