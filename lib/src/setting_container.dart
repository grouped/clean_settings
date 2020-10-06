import 'package:clean_settings/clean_settings.dart';
import 'package:flutter/material.dart';

import 'setting_group.dart';

class SettingContainer extends StatefulWidget {
  final bool nested;
  final List<SettingGroup> groups;

  const SettingContainer({Key key, @required this.groups, this.nested = false}) : super(key: key);

  @override
  _SettingContainerState createState() => _SettingContainerState();
}

class _SettingContainerState extends State<SettingContainer> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    if (widget.groups.length == 1) {
      widget.groups[0].nested = true;
    } else {
      widget.groups.forEach((e) => e.nested = widget.nested);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: widget.groups.length == 1 ? widget.groups[0] : _buildSettingGroupList(widget.groups),
    );
  }

  Widget _buildSettingGroupList(List<SettingGroup> settingGroups) {
    return ListView(
      shrinkWrap: true,
      children: settingGroups
          .map((e) => SettingItem(title: e.title, onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => e))))
          .toList(),
    );
  }
}
