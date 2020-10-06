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

  final List<SettingRadioValue<T>> values;
  final ValueChanged<T> onChanged;

  const SettingRadioItem({
    Key key,
    @required this.title,
    @required this.values,
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
        T changedValue = await showDialog(
          context: context,
          builder: (_) => SimpleDialog(
            title: Text(title),
            children: values
                .map((e) => RadioListTile(
                      selected: e.value == selectedValue,
                      dense: true,
                      title: Text(e.title),
                      value: e.value,
                      onChanged: (value) => Navigator.of(context, rootNavigator: true).pop(e.value),
                      groupValue: null,
                    ))
                .toList(),
          ),
        );
        if (changedValue != null) {
          onChanged(changedValue);
        }
      },
    );
  }
}
