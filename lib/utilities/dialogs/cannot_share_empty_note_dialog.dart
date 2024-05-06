import 'package:flutter/material.dart';
import 'package:medicationhero/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog<void>(
      context: context,
      title: 'Sharing',
      content: 'You cannot share an empty medication list',
      optionsBuilder: () => {
            'OK': null,
          });
}
