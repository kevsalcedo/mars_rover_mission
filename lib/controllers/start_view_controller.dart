import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:rover_app/models/models.dart';

class StartViewController extends GetxController {
  var marsMap = MarsMap(size: 20).obs;
  var rover = Rover().obs;
  var obstaculeFound = false.obs;

  var commands = const Commands.pure('').obs;
  final TextEditingController textEditingController = TextEditingController();

  var availableHeight = 0.0.obs;
  var textFormHeight = 80.0.obs;
  var buttonHeight = 70.0.obs;

  @override
  void onInit() {
    super.onInit();
    generateRandomMap();
  }

  void updateAvailableHeight(double newHeight) {
    availableHeight.value = newHeight;
  }

  generateRandomMap() {
    Random random = Random();
    List<List<String>> updatedGrid = List.generate(
        marsMap.value.size, (_) => List.filled(marsMap.value.size, 'E'));

    for (int i = 0; i < marsMap.value.size; i++) {
      updatedGrid[0][i] = 'O';
      updatedGrid[marsMap.value.size - 1][i] = 'O';
      updatedGrid[i][0] = 'O';
      updatedGrid[i][marsMap.value.size - 1] = 'O';
    }

    updatedGrid[10][10] = 'E';

    int numberOfObstacles = random.nextInt(100) + 10;
    for (int i = 0; i < numberOfObstacles; i++) {
      int x = random.nextInt(marsMap.value.size - 2) + 1;
      int y = random.nextInt(marsMap.value.size - 2) + 1;

      if (x != marsMap.value.size ~/ 2 || y != marsMap.value.size ~/ 2) {
        updatedGrid[x][y] = 'O';
      }
    }

    marsMap.value = marsMap.value.copyWith(grid: updatedGrid);

    rover.value = Rover();
    obstaculeFound.value = false;
  }

  void executeCommand(String command) {
    switch (command) {
      case 'F':
        rover.value.moveForward(marsMap.value.grid);
        if (rover.value.obstacleFound) {
          marsMap.value = marsMap.value.copyWith(rover: rover.value);
          obstaculeFound.value = rover.value.obstacleFound;
        }
        if (!rover.value.obstacleFound) {
          marsMap.value = marsMap.value.copyWith(rover: rover.value);
          obstaculeFound.value = rover.value.obstacleFound;
        }
        break;
      case 'R':
        rover.value.turnRight();
        break;
      case 'L':
        rover.value.turnLeft();
        break;
    }
    marsMap.value = marsMap.value.copyWith(rover: rover.value);
  }

  void onInputChange(String text) {
    final newCommands = Commands.dirty(text);

    commands.value = newCommands;
  }

  onSubmitCommands() {
    final commandString = textEditingController.text.trim();

    if (commandString.isEmpty) {
      commands.value = Commands.dirty(commandString);
      return;
    } else if (commands.value.isValid) {
      String commandString = commands.value.value.toUpperCase();
      for (int i = 0; i < commandString.length; i++) {
        String command = commandString[i];
        executeCommand(command);
        if (rover.value.obstacleFound && command == 'F') {
          break;
        }
      }
      textEditingController.clear();
      commands.value = const Commands.pure('');
    } else {
      commands.value = Commands.dirty(commandString);
    }
  }
}
