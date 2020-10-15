import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingSection extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final List<Widget> items;

  const SettingSection({Key key, @required this.items, this.title, this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          ListTile(
              title: Text(title, style: titleStyle ?? kGetDefaultSectionTitleStyle(context)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              dense: true,
              visualDensity: VisualDensity.compact),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 2.0, color: Theme.of(context).dividerColor),
          itemBuilder: (BuildContext context, int index) => items[index],
        ),
      ],
    );
  }
}
