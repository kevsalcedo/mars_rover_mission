import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:rover_app/controllers/controllers.dart';
import 'package:rover_app/config/constants/constants.dart';
import 'package:rover_app/presentation/widgets/widget.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final StartViewController controller = Get.put(StartViewController());

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() {
            final availableHeight = constraints.maxHeight -
                MediaQuery.of(context).viewInsets.bottom;
            final mapHeight = availableHeight -
                controller.textFormHeight.value -
                controller.buttonHeight.value -
                40; 

            return SizedBox(
              height: mapHeight,
              width: mapHeight,
              child: MapWidget(
                marsMap: controller.marsMap.value,
                rover: controller.rover.value,
              ),
            );
          }),
          const SizedBox(height: 10),
          Obx(
            () => CustomTextFormField(
              onChanged: controller.onInputChange,
              errorMessage: controller.commands.value.errorMessage,
              controller: controller.textEditingController,
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => controller.obstaculeFound.value
                ? CustomButton(
                    title: tryAgainButton,
                    onTapButton: () {
                      controller.onSubmitCommands();
                    },
                    size: 16,
                  )
                : CustomButton(
                    title: startButton,
                    onTapButton: () {
                      controller.onSubmitCommands();
                    },
                    size: 32,
                  ),
          ),
        ],
      );
    });
  }
}
