import 'package:flutter/material.dart';

import 'setting_styles.dart';

class SettingSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const SettingSection({Key key, @required this.title, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
            title: Text(title, style: kSectionTitle),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            dense: true,
            visualDensity: VisualDensity.compact),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 2.0, color: kSeparator),
          itemBuilder: (BuildContext context, int index) => items[index],
        ),
      ],
    );
  }
}
