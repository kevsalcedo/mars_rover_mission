import 'package:flutter/material.dart';
import 'package:rover_app/config/constants/constants.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        //colorSchemeSeed: colorTheme,
        appBarTheme: const AppBarTheme(centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: colorTheme),
      );
}
