import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String displayValue;
  final GestureTapCallback onTap;
  final ItemPriority priority;

  const SettingItem({
    Key key,
    @required this.title,
    this.displayValue,
    @required this.onTap,
    this.priority = ItemPriority.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listTile = ListTile(
      dense: true,
      visualDensity: VisualDensity.comfortable,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      title: Text(title, style: kItemTitle[priority]),
      subtitle: displayValue != null
          ? Text(displayValue, style: kItemSubTitle[priority])
          : null,
    );
    return priority == ItemPriority.disabled
        ? listTile
        : InkWell(onTap: onTap ?? () {}, child: listTile);
  }
}
