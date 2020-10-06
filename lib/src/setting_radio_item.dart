import 'package:flutter/material.dart';

import 'setting_item.dart';

class SettingRadioValue<T> {
  final String title;
  final T value;
  SettingRadioValue(this.title, this.value);
}

class SettingRadioItem<T> extends StatelessWidget {
  final String title;
  final String displayValue;
  final T selectedValue;

  final List<SettingRadioValue<T>> items;
  final ValueChanged<T> onChanged;

  const SettingRadioItem({
    Key key,
    @required this.title,
    @required this.items,
    @required this.onChanged,
    @required this.displayValue,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      title: title,
      displayValue: displayValue,
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
                        onChanged: (value) => Navigator.of(context, rootNavigator: true).pop(e.value),
                        groupValue: selectedValue,
                      ))
                  .toList(),
              FlatButton(child: const Text('Cancel'), onPressed: () => Navigator.pop(context)),
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
