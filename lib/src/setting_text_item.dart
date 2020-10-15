import 'package:flutter/material.dart';

import 'setting_item.dart';
import 'setting_styles.dart';

class SettingTextItem extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String displayValue;
  final TextStyle displayValueStyle;
  final String hintText;
  final String initialValue;

  final ValueChanged<String> onChanged;
  final ItemPriority priority;

  const SettingTextItem({
    Key key,
    @required this.title,
    this.titleStyle,
    @required this.onChanged,
    @required this.displayValue,
    this.displayValueStyle,
    this.initialValue,
    this.hintText,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      priority: priority,
      title: title,
      titleStyle: titleStyle,
      displayValue: displayValue,
      displayValueStyle: displayValueStyle,
      onTap: () async {
        var changedValue = await showDialog(
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
                FlatButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.pop(context)),
                FlatButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.pop(context, controller.text))
              ],
            );
          },
        );
        if (changedValue != initialValue) {
          onChanged(changedValue);
        }
      },
    );
  }
}
