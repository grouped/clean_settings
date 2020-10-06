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



* Radio Picker
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/radio-item.gif)

* Text Input
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/text-item.gif)

* Date Picker
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/date-item.gif)

* Date and Time Picker
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/datetime-item.gif)

* Time Picker
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/time-item.gif)

* Wheel - Number List
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/wheel-number-item.gif)

* Wheel - Text
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/wheel-text-item.gif)

* Custom Handler
![Checkbox Widget](https://raw.githubusercontent.com/grouped/clean_settings/master/demo/custom-handler-item.gif)

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


