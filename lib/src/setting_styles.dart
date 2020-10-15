import 'package:flutter/material.dart';

enum ItemPriority { normal, high, low, disabled }

TextStyle kGetDefaultSectionTitleStyle(BuildContext context){
  return TextStyle(fontSize: 13, color: Theme.of(context).accentColor);
}

TextStyle kGetDefaultTitleStyle(BuildContext context, ItemPriority priority){
  switch(priority){
    case ItemPriority.high:
      return const TextStyle(fontSize: 14, color: const Color(0xffd95b58));
    case ItemPriority.low:
      return const TextStyle(fontSize: 14, color: Color(0xff3e7e0b));
    case ItemPriority.normal:
      return TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyText1.color);
    case ItemPriority.disabled:
      return TextStyle(fontSize: 14, color: Theme.of(context).disabledColor);
  }
}

TextStyle kGetDefaultSubTitleStyle(BuildContext context, ItemPriority priority){
  switch(priority){
    case ItemPriority.high:
      return const TextStyle(fontSize: 12.0, color: Color(0xffd95b58));
    case ItemPriority.low:
      return const TextStyle(fontSize: 12, color: Color(0xff3e7e0b));
    case ItemPriority.normal:
      return TextStyle(fontSize: 12, color: Theme.of(context).textTheme.caption.color);
    case ItemPriority.disabled:
      return TextStyle(fontSize: 12, color: Theme.of(context).disabledColor);
  }
}

Color kGetSeperatorColor(BuildContext context){
  return Theme.of(context).dividerColor;
}

const kWheelPickerItem = TextStyle(fontSize: 13.0, color: Color(0xff5f6369));
