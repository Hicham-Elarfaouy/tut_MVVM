import 'package:flutter/material.dart';
import 'package:flutter_app8/presentation/resources/color_manager.dart';
import 'package:flutter_app8/presentation/resources/font_manager.dart';
import 'package:flutter_app8/presentation/resources/style_manager.dart';
import 'package:flutter_app8/presentation/resources/values_manager.dart';

ThemeData lightTheme() {
  return ThemeData(
    /* colors */
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    /* cardView */
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: 4,
    ),

    /* app bar */
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: 4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: regularStyle(
          fontSize: FontSize.s16,
          color: ColorManager.white,
        )),

    /* button */
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
    ),

    /* elevated button */
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: regularStyle(
          fontSize: FontSize.s17,
          color: ColorManager.white,
        ),
      ),
    ),

    /* text */
    textTheme: TextTheme(
      headlineLarge: semiBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.darkGrey,
      ),
      headlineMedium: regularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),
      labelMedium: regularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.primary,
      ),
      titleMedium: mediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.lightGrey,
      ),
      bodyLarge: regularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.grey1,
      ),
      bodyMedium: regularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.grey,
      ),
      displayLarge: lightStyle(
        fontSize: FontSize.s20,
        color: ColorManager.white,
      ),
    ),

    /* input*/
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      hintStyle: regularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.grey,
      ),

      labelStyle: mediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.grey,
      ),

      errorStyle: regularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.error,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.grey,
          width: 1.5,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.error,
          width: 1.5,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: ColorManager.primary,
          width: 1.5,
        ),
      ),

    ),

  );
}
