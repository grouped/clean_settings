import 'package:flutter/cupertino.dart';

enum ItemPriority { normal, high, low, disabled }

const kSectionTitle = TextStyle(fontSize: 13.0, color: Color(0xff1b73e8));
const kSeparator = Color(0xffe0e0e0);
const kItemTitle = {
  ItemPriority.normal: TextStyle(fontSize: 14.0, color: Color(0xff5f6369)),
  ItemPriority.high: TextStyle(fontSize: 14.0, color: Color(0xffd95b58)),
  ItemPriority.low: TextStyle(fontSize: 14.0, color: Color(0xff3e7e0b)),
  ItemPriority.disabled: TextStyle(fontSize: 14.0, color: Color(0xff9a9fa7)),
};
const kItemSubTitle = {
  ItemPriority.normal: TextStyle(fontSize: 12.0, color: Color(0xff757575)),
  ItemPriority.high: TextStyle(fontSize: 12.0, color: Color(0xffd95b58)),
  ItemPriority.low: TextStyle(fontSize: 12.0, color: Color(0xff3e7e0b)),
  ItemPriority.disabled: TextStyle(fontSize: 12.0, color: Color(0xffbdbdbd)),
};
const kWheelPickerItem = TextStyle(fontSize: 13.0, color: Color(0xff5f6369));
