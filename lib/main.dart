import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:rover_app/config/theme/app_theme.dart';
import 'package:rover_app/config/constants/constants.dart';
import 'package:rover_app/presentation/screens/home_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: appTitle,
      theme: AppTheme().getTheme(),
    ),
  );
}
