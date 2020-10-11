import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingCheckboxItem extends StatelessWidget {
  final String title;
  final String description;
  final ItemPriority priority;

  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingCheckboxItem({
    Key key,
    @required this.title,
    @required this.value,
    this.onChanged,
    this.priority = ItemPriority.normal,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title, style: kItemTitle[priority]),
      subtitle: description != null ? Text(description, style: kItemSubTitle[priority]) : null,
      value: value,
      onChanged: priority == ItemPriority.disabled ? null : onChanged,
    );
  }
}
