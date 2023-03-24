import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'static';

  TextStyle get textRegular => TextStyle(fontFamily: font, fontWeight: FontWeight.w400);
  TextStyle get textMedium => TextStyle(fontFamily: font, fontWeight: FontWeight.w500);
  TextStyle get textSemiBold => TextStyle(fontFamily: font, fontWeight: FontWeight.w600);
  TextStyle get textBold => TextStyle(fontFamily: font, fontWeight: FontWeight.w700);
  TextStyle get textExtraBold => TextStyle(fontFamily: font, fontWeight: FontWeight.w800);
  TextStyle get textBlack => TextStyle(fontFamily: font, fontWeight: FontWeight.w900);
  TextStyle get textItalic => TextStyle(fontFamily: font, fontStyle: FontStyle.italic);
  TextStyle get textMediumItalic => TextStyle(fontFamily: font, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic);
  TextStyle get textSemiBoldItalic => TextStyle(fontFamily: font, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic);
  TextStyle get textBoldItalic => TextStyle(fontFamily: font, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
  TextStyle get textExtraBoldItalic => TextStyle(fontFamily: font, fontWeight: FontWeight.w800, fontStyle: FontStyle.italic);
  TextStyle get textBlackItalic => TextStyle(fontFamily: font, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
