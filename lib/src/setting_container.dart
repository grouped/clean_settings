import 'package:flutter/material.dart';

import 'setting_section.dart';

class SettingContainer extends StatefulWidget {
  final List<SettingSection> sections;

  const SettingContainer({Key? key, required this.sections}) : super(key: key);

  @override
  _SettingContainerState createState() => _SettingContainerState();
}

class _SettingContainerState extends State<SettingContainer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: ListView(
          shrinkWrap: true,
          children: widget.sections,
        ));
  }
}
