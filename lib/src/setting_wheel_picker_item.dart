import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'setting_item.dart';
import 'setting_styles.dart';

class SettingWheelPickerItem<T> extends StatelessWidget {
  final String title;
  final String? displayValue;
  final String? pickerSuffix;
  final List<T> items;
  final int initialValueIndex;

  final ValueChanged<int> onChanged;
  final ItemPriority priority;

  const SettingWheelPickerItem({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.displayValue,
    required this.items,
    this.initialValueIndex = 0,
    this.pickerSuffix,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      priority: priority,
      title: title,
      displayValue: displayValue,
      onTap: () async {
        var changedValueIndex = await showDialog(
          context: context,
          builder: (_) {
            var selectedValueIndex = initialValueIndex;
            var pickerWidget = Expanded(
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: initialValueIndex),
                itemExtent: 50.0,
                onSelectedItemChanged: (int value) {
                  selectedValueIndex = value;
                },
                children: items
                    .map((e) => Center(
                          child: Text(
                            e.toString(),
                            style: kWheelPickerItem,
                          ),
                        ))
                    .toList(),
              ),
            );
            return AlertDialog(
              title: Text(title),
              content: Container(
                constraints: BoxConstraints(maxHeight: 100.0),
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pickerSuffix == null
                        ? [pickerWidget]
                        : [
                            SizedBox(width: 100.0, child: pickerWidget),
                            Text(pickerSuffix!),
                          ]),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, selectedValueIndex),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        if (changedValueIndex != null &&
            changedValueIndex != initialValueIndex) {
          onChanged(changedValueIndex);
        }
      },
    );
  }
}
