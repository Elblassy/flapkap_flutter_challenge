import 'package:flapkap_flutter_challenge/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget titleText(
  String text, {
  translation = true,
  Color color = Colors.black,
  TextOverflow overflow = TextOverflow.visible,
}) {
  return Text(
    text,
    overflow: overflow,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: isMobile() ? 34.sp : 38.sp,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        color: color,
      ),
    ),
  );
}

Widget medText(
  String text, {
  translation = true,
  Color color = Colors.black,
  TextOverflow overflow = TextOverflow.visible,
}) {
  return Text(
   text,
    overflow: overflow,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize:30.sp,
        decoration: TextDecoration.none,
        color: color,
      ),
    ),
  );
}

Widget smallText(
  String text, {
  translation = true,
  Color color = Colors.black,
  TextOverflow overflow = TextOverflow.visible,
}) {
  return Text(
   text,
    overflow: overflow,
    style: GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 24.sp,
        decoration: TextDecoration.none,
        color: color,
      ),
    ),
  );
}
