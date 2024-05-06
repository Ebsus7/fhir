import 'package:flutter/material.dart';
import 'package:medicationhero/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'An Error Occurred',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
