import 'package:flutter/material.dart';

import '../constants/constants.dart';

final ThemeData theme = ThemeData(
  primarySwatch: Colors.amber,
  primaryColor: kPrimaryColor,
  accentColor: kAccentColor,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
  brightness: Brightness.dark,
  fontFamily: 'Acme',
  appBarTheme: AppBarTheme(elevation: 0, centerTitle: true),
  errorColor: Colors.deepOrange,
);
