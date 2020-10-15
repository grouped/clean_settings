import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingCheckboxItem extends StatelessWidget {
  final String title;
  ///Custom [TextStyle] to use for the title
  ///
  /// Setting this property disables title coloring based on the [priority] parameter
  final TextStyle titleStyle;
  final String description;
  ///Custom [TextStyle] to use for the title
  ///
  /// Setting this property disables description coloring based on the [priority] parameter
  final TextStyle descriptionStyle;
  final ItemPriority priority;

  final bool value;
  final ValueChanged<bool> onChanged;

  /// @this.titleStyle The
  const SettingCheckboxItem({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onChanged,
    this.titleStyle,
    this.descriptionStyle,
    this.priority = ItemPriority.normal,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
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
