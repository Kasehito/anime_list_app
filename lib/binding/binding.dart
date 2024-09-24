import 'package:anime_list_app/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/anime_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeController>(() => AnimeController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
