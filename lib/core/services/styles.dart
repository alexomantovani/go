import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  const Styles._();

  static const Color kPrimaryRed = Color(0xFFD11521);
  static const Color kPrimaryRedDark = Color(0xFFB8000C);
  static const Color kPrimaryGreen = Color(0xFF1BB98E);
  static const Color kPrimaryYellow = Color(0xFFFFB100);
  static const Color kPrimaryGrey = Color(0xFFC2C2C2);
  static const Color kPrimaryText = Color(0xFF4A4A4A);
  static const Color kPrimaryPale = Color(0xFFF0F0F0);
  static const Color kPrimaryAuthCard = Color(0xFF585858);
  static const Color kSecondaryPale = Color(0xFFF8F9FB);
  static const Color kStandardWhite = Color(0xFFFFFFFF);
  static const Color kStandardBlack = Color(0xFF000000);

  static TextStyle titleLarge = GoogleFonts.inter(
    color: kPrimaryRed,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    color: kPrimaryRed,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle titleSmall = GoogleFonts.inter(
    color: kPrimaryText,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    color: kPrimaryText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    color: kPrimaryText,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
