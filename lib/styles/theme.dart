import 'package:flutter/material.dart';
import 'package:EasyShop/styles/colors.dart';

String gilroyFontFamily = 'Gilroy';

ThemeData themeData = ThemeData(
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
);
