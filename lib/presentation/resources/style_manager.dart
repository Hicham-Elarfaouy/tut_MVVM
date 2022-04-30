import 'package:flutter/material.dart';
import 'package:flutter_app8/presentation/resources/font_manager.dart';

TextStyle _textStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontFamily: FontFamily.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// Bold style
TextStyle boldStyle({
  required double fontSize,
  required Color color,
}) {
  return _textStyle(fontSize, FontWeightM.bold, color);
}

// SemiBold style
TextStyle semiBoldStyle({
  required double fontSize,
  required Color color,
}) {
  return _textStyle(fontSize, FontWeightM.semiBold, color);
}

// Medium style
TextStyle mediumStyle({
  required double fontSize,
  required Color color,
}) {
  return _textStyle(fontSize, FontWeightM.medium, color);
}

// Regular style
TextStyle regularStyle({
  required double fontSize,
  required Color color,
}) {
  return _textStyle(fontSize, FontWeightM.regular, color);
}

// Light style
TextStyle lightStyle({
  required double fontSize,
  required Color color,
}) {
  return _textStyle(fontSize, FontWeightM.light, color);
}