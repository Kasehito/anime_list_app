import 'package:anime_list_app/controller/bottom_nav_controller.dart';
import 'package:anime_list_app/controller/auth_controller.dart';
import 'package:anime_list_app/controller/db_controller.dart';
import 'package:get/get.dart'; // Ensure this file exists at the specified path

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DbController>(() => DbController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
