import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/themes/colors.dart';

abstract class AppStyle {
  static final TextStyle bold24Gold = TextStyle(
    fontSize: 24,
    fontFamily: 'Janna LT',
    fontWeight: FontWeight.bold,
    color: AppColors.goldColor,
  );
  static final TextStyle bold20Gold = TextStyle(
    fontSize: 20,
    fontFamily: 'Janna LT',
    fontWeight: FontWeight.bold,
    color: AppColors.goldColor,
  );

  static final TextStyle bold20White = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
    fontFamily: GoogleFonts.tajawal().fontFamily,
  );
  static final TextStyle bold25White = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
    fontFamily: GoogleFonts.tajawal().fontFamily,
  );

  static final InputBorder radious10BorderWhite = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.whiteColor),
  );
}
