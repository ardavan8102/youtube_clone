import 'package:flutter/material.dart';
import 'package:youtube_clone/core/consts/colors.dart';
import 'package:youtube_clone/core/theme/typography.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(
    brightness: .dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackground,
    primaryColor: AppColors.primary,

    fontFamily: 'montserrat',

    textTheme: TextTheme(
      // Headlines
      headlineLarge: AppTypography.headlineLargeStyle,
      headlineMedium: AppTypography.headlineMediumStyle,
      headlineSmall: AppTypography.headlineSmallStyle,
      
    ),
  );

}