import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final String displayValue;
  final GestureTapCallback onTap;

  const SettingItem(
      {Key key, @required this.title, this.displayValue, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.comfortable,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        title: Text(title, style: kItemTitle),
        subtitle: displayValue != null
            ? Text(displayValue, style: kItemSubTitle)
            : null,
      ),
    );
  }
}
