import 'package:flutter/material.dart';

import 'setting_item.dart';
import 'setting_styles.dart';

class SettingTextItem extends StatelessWidget {
  final String title;
  final String? displayValue;
  final String? hintText;
  final String? initialValue;

  final ValueChanged<String> onChanged;
  final ItemPriority priority;

  const SettingTextItem({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.displayValue,
    this.initialValue,
    this.hintText,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      priority: priority,
      title: title,
      displayValue: displayValue,
      onTap: () async {
        final changedValue = await showDialog(
          context: context,
          builder: (_) {
            var controller = TextEditingController(text: initialValue);
            return AlertDialog(
              title: Text(title),
              contentPadding: const EdgeInsets.all(16.0),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      autofocus: true,
                      decoration: InputDecoration(hintText: hintText),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, controller.text),
                  child: const Text('OK'),
                )
              ],
            );
          },
        );
        if (changedValue != null && changedValue != initialValue) {
          onChanged(changedValue);
        }
      },
    );
  }
}
