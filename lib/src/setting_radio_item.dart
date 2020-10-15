import 'package:flutter/material.dart';

import 'setting_item.dart';
import 'setting_styles.dart';

class SettingRadioValue<T> {
  final String title;
  final T value;
  SettingRadioValue(this.title, this.value);
}

class SettingRadioItem<T> extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String displayValue;
  final TextStyle displayValueStyle;
  final T selectedValue;

  final List<SettingRadioValue<T>> items;
  final ValueChanged<T> onChanged;
  final String cancelText;
  final ItemPriority priority;

  const SettingRadioItem({
    Key key,
    @required this.title,
    this.titleStyle,
    @required this.items,
    @required this.onChanged,
    this.displayValue,
    this.displayValueStyle,
    this.selectedValue,
    this.cancelText,
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
          builder: (_) => SimpleDialog(
            title: Text(title),
            children: [
              ...items
                  .map((e) => RadioListTile(
                        autofocus: true,
                        selected: e.value == selectedValue,
                        dense: true,
                        title: Text(e.title, style: TextStyle(fontSize: 14.0)),
                        value: e.value,
                        onChanged: (value) =>
                            Navigator.of(context, rootNavigator: true)
                                .pop(e.value),
                        groupValue: selectedValue,
                      ))
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        child: Text(cancelText ?? 'Cancel'),
                        onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
            ],
          ),
        );
        if (changedValue != null) {
          onChanged(changedValue);
        }
      },
    );
  }
}
