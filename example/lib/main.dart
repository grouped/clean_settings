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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  String theme = 'System Default';
  bool smartReply = false;
  String autoReplyMessage;
  int daysOfMailToSync = 5;

  int chosenReplyOptionIndex = 1;
  DateTime dateOfBirth = DateTime.now();
  DateTime scheduledEmailDateTime = DateTime.now();
  TimeOfDay dailyEmailAt = TimeOfDay(hour: 9, minute: 0);

  @override
  Widget build(BuildContext context) {
    String dateOfBirthSlug = "${dateOfBirth.year.toString()}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}";
    String scheduledEmailSlug =
        "${scheduledEmailDateTime.year.toString()}-${scheduledEmailDateTime.month.toString().padLeft(2, '0')}-${scheduledEmailDateTime.day.toString().padLeft(2, '0')} ${scheduledEmailDateTime.hour.toString().padLeft(2, '0')}:${scheduledEmailDateTime.minute.toString().padLeft(2, '0')}";

    var replyOptions = ['Reply', 'Reply All', 'Last Chosen', 'None'];
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
          sections: [
            SettingSection(
              title: 'Appearance',
              items: [
                SettingItem(
                  title: 'Simple Counter',
                  displayValue: counter.toString(),
                  onTap: () => setState(() => counter++),
                ),
                SettingRadioItem<String>(
                  title: 'Theme',
                  displayValue: '$theme theme',
                  selectedValue: theme,
                  items: [
                    SettingRadioValue('Light', 'Light'),
                    SettingRadioValue('Dark', 'Dark'),
                    SettingRadioValue('System Default', 'System Default'),
                  ],
                  onChanged: (v) => setState(() => theme = v),
                ),
              ],
            ),
            SettingSection(
              title: 'Inbox',
              items: [
                SettingCheckboxItem(
                    title: 'Smart Reply',
                    value: smartReply,
                    onChanged: (v) => setState(() => smartReply = v),
                    description: 'Show suggested replies when available'),
                SettingTextItem(
                  title: 'Auto Reply Message',
                  displayValue: autoReplyMessage,
                  hintText: 'Sent by system on away',
                  onChanged: (v) => setState(() => autoReplyMessage = v),
                ),
                SettingWheelPickerItem(
                  title: 'Days of mail to sync',
                  displayValue: daysOfMailToSync.toString(),
                  initialValueIndex: daysOfMailToSync,
                  items: List.generate(10, (index) => index.toString()),
                  onChanged: (v) => setState(() => daysOfMailToSync = v),
                ),
                SettingWheelPickerItem(
                  title: 'Default reply action',
                  displayValue: replyOptions[chosenReplyOptionIndex],
                  initialValueIndex: chosenReplyOptionIndex,
                  items: replyOptions,
                  onChanged: (v) => setState(() => chosenReplyOptionIndex = v),
                ),
                SettingDateTimeItem<DateTime>(
                  title: 'Next Scheduled Email At',
                  displayValue: scheduledEmailSlug,
                  onChanged: (v) => setState(() => scheduledEmailDateTime = v),
                ),
                SettingDateTimeItem<DateTime>(
                  title: 'Date of birth',
                  displayValue: dateOfBirthSlug,
                  onChanged: (v) => setState(() => dateOfBirth = v),
                  timePicker: false,
                ),
                SettingDateTimeItem<TimeOfDay>(
                  title: 'Daily wake up email',
                  displayValue: dailyEmailAt.format(context),
                  onChanged: (v) => setState(() => dailyEmailAt = v),
                  datePicker: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
