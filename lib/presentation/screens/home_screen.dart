import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:rover_app/controllers/controllers.dart';
import 'package:rover_app/presentation/views/views.dart';
import 'package:rover_app/config/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.front_loader,
              color: colors.primary,
              size: 32,
            ),
            title: const AppBarTitle(),
            actions: [
              IconButton(
                onPressed: () {
                  final StartViewController controller =
                      Get.put(StartViewController());
                  controller.generateRandomMap();
                },
                icon: Icon(
                  Icons.shuffle,
                  color: colors.primary,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Obx(
                  () => !controller.gameStarted.value
                      ? InitView(onTapButton: () {
                          controller.startGame();
                        })
                      : const StartView(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          appBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: obstacleColor),
        ),
        const Text(
          'To $companyName',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: companyColor, fontSize: 12),
        ),
      ],
    );
  }
}
