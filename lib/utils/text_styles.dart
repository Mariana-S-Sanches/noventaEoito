import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/default_colors.dart';

class CustomTextStyles extends TextStyle {
  static TextStyle headH1 = const TextStyle(
    fontSize: 30,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w600,
    color: DefaultColors.primary_grey,
  );
  static TextStyle menu = const TextStyle(
    fontSize: 20,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w500,
    color: DefaultColors.primary_grey,
  );
  static TextStyle body = const TextStyle(
    fontSize: 20,
    fontFamily: 'montserrat',
    color: DefaultColors.primary_grey,
  );
  static TextStyle bodySmall = const TextStyle(
    fontSize: 15,
    fontFamily: 'montserrat',
    color: DefaultColors.primary_grey,
  );
  static TextStyle label = const TextStyle(
    fontSize: 10,
    fontFamily: 'montserrat',
    color: DefaultColors.primary_grey,
  );
  static TextStyle labelHighlight = const TextStyle(
    fontSize: 10,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w700,
    color: DefaultColors.primaryTheme,
  );
  static TextStyle labelMedium = const TextStyle(
    fontSize: 18,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w600,
    color: DefaultColors.primary_grey,
  );
  static TextStyle labelSmall = const TextStyle(
    fontSize: 16,
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w600,
    color: DefaultColors.primary_grey,
  );
}
