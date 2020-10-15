import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingSwitchItem extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String description;
  final TextStyle descriptionStyle;
  final ItemPriority priority;

  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingSwitchItem({
    Key key,
    @required this.title,
    this.titleStyle,
    @required this.value,
    @required this.onChanged,
    this.priority = ItemPriority.normal,
    this.description,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title, style: titleStyle ?? kGetDefaultTitleStyle(context, priority)),
      subtitle: description != null
          ? Text(description, style: descriptionStyle ?? kGetDefaultSubTitleStyle(context, priority))
          : null,
      value: value,
      onChanged: priority == ItemPriority.disabled ? null : onChanged,
    );
  }
}
