import 'package:flutter/material.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ContactSessionsList {
  const ContactSessionsList._();

  static WoltModalSheetPage build(BuildContext context, Contact contact) {
    return WoltModalSheetPage(
      leadingNavBarWidget: IconButton(
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () {
          WoltModalSheet.of(context).showPrevious();
        },
      ),
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
            subtitle: Text('This is number $index'),
          );
        },
      ),
    );
  }
}
