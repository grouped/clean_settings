import 'dart:async';

import 'package:clean_settings/clean_settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

final myStream = Stream<int>.periodic(Duration(seconds: 1), (x) => (x == 3) ? throw Exception('oops') : x).take(5);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Settings',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: SettingContainer(
          groups: [
            SettingGroup(
              title: 'General Settings',
              sections: [
                SettingSection(
                  title: 'Inbox',
                  items: [
                    SettingItem(
                      title: 'Inbox categories',
                      displayValue: 'Primary, Social, Promotions, Updates, Forums',
                    ),
                  ],
                ),
              ],
            ),
            SettingGroup(
              title: 'flutter@groupedapp.com',
              sections: [
                SettingSection(
                  title: 'Inbox',
                  items: [
                    SettingRadioItem<int>(
                      title: 'Inbox type',
                      displayValue: 'Default Inbox',
                      values: [
                        SettingRadioValue('Default Inbox', 0),
                        SettingRadioValue('Priority Inbox', 1),
                        SettingRadioValue('Scheduled Inbox', 2),
                      ],
                      onChanged: (e) {},
                    ),
                    SettingTextItem(
                      title: 'Inbox categories',
                      displayValue: 'Primary, Social, Promotions, Updates, Forums',
                      onChanged: (e) {},
                      hintText: 'Enter category',
                    ),
                    SettingWheelPickerItem(
                      title: 'Days of mail to sync',
                      displayValue: '30',
                      items: List.generate(10, (index) => index.toString()),
                      onChanged: (num value) {},
                    ),
                    SettingDateTimeItem<DateTime>(
                      title: 'Date of birth',
                      displayValue: 'Primary, Social, Promotions, Updates, Forums',
                      onChanged: (DateTime value) {},
                      timePicker: false,
                    ),
                    SettingItem(
                      title: 'Inbox categories',
                      displayValue: 'Primary, Social, Promotions, Updates, Forums',
                    ),
                  ],
                ),
                SettingSection(
                  title: 'Inbox',
                  items: [
                    SettingItem(title: 'Inbox type', displayValue: 'Default Inbox'),
                    SettingCheckboxItem(title: 'Smart Reply', value: true, onChanged: (v) {}, description: 'Show suggested replies when available'),
                    SettingItem(title: 'Inbox categories', displayValue: 'Primary, Social, Promotions, Updates, Forums'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
