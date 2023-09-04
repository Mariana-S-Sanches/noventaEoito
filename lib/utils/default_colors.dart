// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class DefaultColors {
  static const white = Color(0xffFFFFFF);
  static const background = Color(0xffF5F7FA);
  static const black_popup = Color(0x1F000000);
  static const primary_grey = Color(0xff535355);
  static const highlight_grey = Color(0xff76767A);

  static const red = Color(0xffff6961);
  static const green = Color(0xff77dd77);

  static const MaterialColor neutral = MaterialColor(
    0xff535355,
    <int, Color>{
      50: Color(0xffdddddd),
      100: Color(0xffbababb),
      200: Color(0xff989899),
      300: Color(0xff757577),
      400: Color(0xff535355),
      500: Color(0xff424244),
      600: Color(0xff323233),
      700: Color(0xff2a2a2b),
    },
  );

  static const MaterialColor primaryTheme = MaterialColor(
    0xffdf6234,
    <int, Color>{
      50: Color(0xfff9e0d6),
      100: Color(0xfff2c0ae),
      200: Color(0xffeca185),
      300: Color(0xffe5815d),
      400: Color(0xffdf6234),
      500: Color(0xffb24e2a),
      600: Color(0xff863b1f),
      700: Color(0xff70311a),
    },
  );
}
