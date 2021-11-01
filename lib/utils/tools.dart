import 'package:flutter/material.dart';

const primaryColor = Color(0xFF4d78eb);
const primaryDarkColor = Color(0xFF004db8);
const secondaryColor = Color(0xFFeba029);
const bgColor = Color(0xFFebeeff);
const helperRedColor = Color(0xFFfe5a5a);
const helperBlueColor = Color(0xFF374e8d);

const defaultPadding = 16.0;

var loggedIn = false;

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

bool isMobile() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
  return data.size.shortestSide < 600;
}


