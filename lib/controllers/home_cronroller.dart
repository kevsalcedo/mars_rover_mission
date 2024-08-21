import 'package:get/get.dart';

class HomeController extends GetxController {
  var gameStarted = false.obs;

  startGame() {
    gameStarted.value = true;
  }

}
