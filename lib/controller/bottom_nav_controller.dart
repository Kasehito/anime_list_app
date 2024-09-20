import 'package:get/get.dart';

class BottomNavController extends GetxController {
  //Contains all logical operations methodsk
  var currentIndex = 0.obs;   

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
