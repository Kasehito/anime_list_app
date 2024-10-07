import 'package:anime_list_app/controller/bottom_nav_controller.dart';
import 'package:get/get.dart'; // Ensure this file exists at the specified path

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
