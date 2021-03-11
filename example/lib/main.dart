import 'package:clean_settings_nnbd/clean_settings_nnbd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String? autoReplyMessage;
  int daysOfMailToSync = 5;

  int chosenReplyOptionIndex = 1;
  DateTime dateOfBirth = DateTime.now();
  DateTime scheduledEmailDateTime = DateTime.now();
  TimeOfDay dailyEmailAt = TimeOfDay(hour: 9, minute: 0);

  bool disableDemoItems = false;

  bool smartCompose = true;

  @override
  Widget build(BuildContext context) {
    String dateOfBirthSlug =
        "${dateOfBirth.year.toString()}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}";
    String scheduledEmailSlug =
        "${scheduledEmailDateTime.year.toString()}-${scheduledEmailDateTime.month.toString().padLeft(2, '0')}-${scheduledEmailDateTime.day.toString().padLeft(2, '0')} ${scheduledEmailDateTime.hour.toString().padLeft(2, '0')}:${scheduledEmailDateTime.minute.toString().padLeft(2, '0')}";

    var replyOptions = ['Reply', 'Reply All', 'Last Chosen', 'None'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Settings',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: SettingContainer(
          sections: [
            SettingSection(
              title: 'Demo Options',
              items: [
                SettingCheckboxItem(
                  title: 'Disable all items',
                  description: 'Disabled all demo options',
                  priority: ItemPriority.high,
                  value: disableDemoItems,
                  onChanged: (v) =>
                      setState(() => disableDemoItems = v != null ? v : false),
                ),
              ],
            ),
            SettingSection(
              title: 'Appearance',
              items: [
                SettingItem(
                  title: 'Simple Counter',
                  displayValue: counter.toString(),
                  onTap: () => setState(() => counter++),
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingItem(
                  title: 'Launch Unicorn Startup',
                  displayValue: 'Raise billions',
                  onTap: () => setState(() => counter++),
                  priority: ItemPriority.disabled,
                ),
                SettingRadioItem<String>(
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
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
              title: 'Interactive',
              items: [
                SettingConfirmItem(
                  title: 'Delete account',
                  displayValue: 'Permanently deletes your account',
                  alertTitle: 'Delete your account',
                  alertMessage: 'Are you sure?',
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.high,
                  onConfirm: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Confirmed!'),
                          duration: Duration(seconds: 3))),
                  onCancel: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Canceled!'),
                          duration: Duration(seconds: 3))),
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
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
              ],
            ),
            SettingSection(
              title: 'Inbox',
              items: [
                SettingCheckboxItem(
                  title: 'Smart Reply',
                  value: smartReply,
                  onChanged: (v) =>
                      setState(() => smartReply = v != null ? v : false),
                  description: 'Show suggested replies when available',
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingSwitchItem(
                  title: 'Smart Compose',
                  value: smartCompose,
                  onChanged: (v) => setState(() => smartCompose = v),
                  description: 'Show predictive writing suggestions',
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingTextItem(
                  title: 'Auto Reply Message',
                  displayValue: autoReplyMessage,
                  initialValue: autoReplyMessage,
                  hintText: 'Sent by system on away',
                  onChanged: (v) => setState(() => autoReplyMessage = v),
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingWheelPickerItem(
                  title: 'Days of mail to sync',
                  displayValue: daysOfMailToSync.toString(),
                  initialValueIndex: daysOfMailToSync,
                  items: List.generate(10, (index) => index.toString()),
                  onChanged: (v) => setState(() => daysOfMailToSync = v),
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingWheelPickerItem(
                  title: 'Default reply action',
                  displayValue: replyOptions[chosenReplyOptionIndex],
                  initialValueIndex: chosenReplyOptionIndex,
                  items: replyOptions,
                  onChanged: (v) => setState(() => chosenReplyOptionIndex = v),
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingDateTimeItem<DateTime>(
                  title: 'Next Scheduled Email At',
                  displayValue: scheduledEmailSlug,
                  onChanged: (v) => setState(() => scheduledEmailDateTime = v),
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingDateTimeItem<DateTime>(
                  title: 'Date of birth',
                  displayValue: dateOfBirthSlug,
                  onChanged: (v) => setState(() => dateOfBirth = v),
                  timePicker: false,
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
                SettingDateTimeItem<TimeOfDay>(
                  title: 'Daily wake up email',
                  displayValue: dailyEmailAt.format(context),
                  onChanged: (v) => setState(() => dailyEmailAt = v),
                  datePicker: false,
                  priority: disableDemoItems
                      ? ItemPriority.disabled
                      : ItemPriority.normal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
