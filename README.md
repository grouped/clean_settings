[![pub package](https://img.shields.io/pub/v/clean_settings.svg)](https://pub.dartlang.org/packages/clean_settings)

# clean_settings

Settings UI generator with sane defaults.

Creating a settings screen requires the same boiler plate code over and over. Settings also need a rich set of widgets to cover all possible cases. This library aims to provide sane defaults while creating a setting screen.

## Buy Me A Coffee

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/arif "Buy Me A Coffee")

## Features

* Setting Sections
* Out-of-the-box widgets for multiple types

## Widgets supported

* Checkbox


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/checkbox-item.gif)

```dart

SettingCheckboxItem(
    title: 'Smart Reply',
    value: smartReply,
    onChanged: (v) => setState(() => smartReply = v),
    description: 'Show suggested replies when available'),
```

* Radio Picker


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/radio-item.gif)

```dart

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

```

* Text Input


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/text-item.gif)

```dart
SettingTextItem(
  title: 'Auto Reply Message',
  displayValue: autoReplyMessage,
  initialValue: autoReplyMessage,
  hintText: 'Sent by system on away',
  onChanged: (v) => setState(() => autoReplyMessage = v),
),

```

* Date and Time Picker


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/datetime-item.gif)

```dart
SettingDateTimeItem<DateTime>(
  title: 'Next Scheduled Email At',
  displayValue: scheduledEmailSlug,
  onChanged: (v) => setState(() => scheduledEmailDateTime = v),
),
```


* Date Picker


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/date-item.gif)

```dart
SettingDateTimeItem<DateTime>(
  title: 'Date of birth',
  displayValue: dateOfBirthSlug,
  onChanged: (v) => setState(() => dateOfBirth = v),
  timePicker: false,
),
```

* Time Picker


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/time-item.gif)

```dart
SettingDateTimeItem<TimeOfDay>(
  title: 'Daily wake up email',
  displayValue: dailyEmailAt.format(context),
  onChanged: (v) => setState(() => dailyEmailAt = v),
  datePicker: false,
),
```


* Wheel - Number List


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/wheel-number-item.gif)

```dart
SettingWheelPickerItem(
  title: 'Days of mail to sync',
  displayValue: daysOfMailToSync.toString(),
  initialValueIndex: daysOfMailToSync,
  items: List.generate(10, (index) => index.toString()),
  onChanged: (v) => setState(() => daysOfMailToSync = v),
),
```


* Wheel - Text


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/wheel-text-item.gif)

```dart
var replyOptions = ['Reply', 'Reply All', 'Last Chosen', 'None'];
SettingWheelPickerItem(
  title: 'Default reply action',
  displayValue: replyOptions[chosenReplyOptionIndex],
  initialValueIndex: chosenReplyOptionIndex,
  items: replyOptions,
  onChanged: (v) => setState(() => chosenReplyOptionIndex = v),
),

```


* Custom Handler


![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/custom-handler-item.gif)

```dart
SettingItem(
  title: 'Simple Counter',
  displayValue: counter.toString(),
  onTap: () => setState(() => counter++),
),
```

## Structure

```

Root - SettingContainer
         \
          \_ SettingSection
                 \
                  \_ SettingItem (or Variants) 

```

## Example

Creates a simple Checkbox setting item

```dart
SettingContainer(
  sections: [
    SettingSection(
      title: 'Appearance',
      items: [
        SettingCheckboxItem(
            title: 'Smart Reply',
            value: smartReply,
            onChanged: (v) => setState(() => smartReply = v),
            description: 'Show suggested replies when available'),
      ],
    ),
  ],
)
```

## Notes

* Early version
* API bound to change as more widgets get added
* Please report bugs/issues/features

