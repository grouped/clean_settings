import 'package:flutter/material.dart';

import 'setting_section.dart';

class SettingGroup extends StatefulWidget {
  bool nested;
  final String title;
  final List<SettingSection> sections;

  SettingGroup({Key key, @required this.title, @required this.sections, this.nested = false}) : super(key: key);

  @override
  _SettingGroupState createState() => _SettingGroupState();
}

class _SettingGroupState extends State<SettingGroup> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: widget.sections,
    );
    return widget.nested
        ? listView
        : Scaffold(
            appBar: AppBar(
              leading: InkWell(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.arrow_back, color: Colors.black87)),
              title: Text(
                widget.title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black87),
              ),
              centerTitle: false,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: listView,
          );
  }
}
