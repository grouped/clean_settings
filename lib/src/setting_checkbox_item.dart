import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingCheckboxItem extends StatelessWidget {
  final String title;
  final String description;

  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingCheckboxItem({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onChanged,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title, style: kItemTitle),
      subtitle: description != null ? Text(description, style: kItemSubTitle) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
