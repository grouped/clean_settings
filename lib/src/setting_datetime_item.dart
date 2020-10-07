import 'package:flutter/material.dart';

import 'setting_item.dart';

class SettingDateTimeItem<T> extends StatelessWidget {
  final String title;
  final String displayValue;
  final DateTime initialDate;

  final ValueChanged<T> onChanged;
  final bool timePicker;
  final bool datePicker;

  SettingDateTimeItem({
    Key key,
    @required this.title,
    @required this.onChanged,
    @required this.displayValue,
    this.initialDate,
    this.datePicker = true,
    this.timePicker = true,
  }) : super(key: key) {
    assert(datePicker || timePicker);
    assert(T == DateTime || !datePicker);
    assert(T == TimeOfDay || datePicker);
  }

  @override
  Widget build(BuildContext context) {
    return SettingItem(
        title: title,
        displayValue: displayValue,
        onTap: () async {
          DateTime datePicked;
          if (datePicker) {
            datePicked = await showDatePicker(
              context: context,
              initialDate: initialDate ?? DateTime.now(),
              firstDate: DateTime(1970),
              lastDate: DateTime(2101),
            );

            if (datePicked == null) {
              return;
            }
          }

          if (!timePicker) {
            onChanged(
                DateTime(datePicked.year, datePicked.month, datePicked.day)
                    as T);
            return;
          }

          final TimeOfDay todPicked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
          );

          if (todPicked == null) {
            return;
          }

          if (!datePicker) {
            onChanged(todPicked as T);
            return;
          }

          onChanged(DateTime(
            datePicked.year,
            datePicked.month,
            datePicked.day,
            todPicked.hour,
            todPicked.minute,
          ) as T);
        });
  }
}
