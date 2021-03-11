import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingConfirmItem extends StatelessWidget {
  final String title;
  final String? displayValue;
  final String alertMessage;
  final String? alertTitle;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String okButtonText;
  final String cancelButtonText;
  final ItemPriority priority;

  const SettingConfirmItem({
    Key? key,
    required this.title,
    this.alertMessage = '',
    required this.onConfirm,
    this.alertTitle,
    this.displayValue,
    this.onCancel,
    this.okButtonText = 'Ok',
    this.cancelButtonText = 'Cancel',
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      dense: true,
      visualDensity: VisualDensity.comfortable,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title, style: kItemTitle[priority]),
      subtitle: displayValue != null
          ? Text(displayValue!, style: kItemSubTitle[priority])
          : null,
    );
    return priority == ItemPriority.disabled
        ? listTile
        : InkWell(onTap: () => _showConfirmDialog(context), child: listTile);
  }

  Future<void> _showConfirmDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(alertTitle ?? title),
          content: Text(alertMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(cancelButtonText),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(okButtonText),
            ),
          ],
        );
      },
    );
    if (result != null && result) {
      onConfirm();
    } else {
      if (onCancel != null) onCancel!();
    }
  }
}
