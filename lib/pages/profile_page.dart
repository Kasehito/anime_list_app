import 'package:anime_list_app/component/my_button.dart';
import 'package:anime_list_app/controller/auth_controller.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';
import 'package:anime_list_app/layout/watchlist_view.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final AuthController authController = Get.find<AuthController>();
  final WatchlistController watchlistController =
      Get.put(WatchlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Icon(Icons.person, size: 100, color: MyColors.primaryColor),
              const SizedBox(
                width: 15,
              ),
              Text(
                authController.username.value,
                // 'username',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyButton(
                text: 'Edit Profile',
                onpressed: () {},
                bgColor: MyColors.primaryColor,
                fgColor: MyColors.primaryLightColor,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: SizedBox()),
              MyButton(
                text: 'Logout',
                onpressed: () {
                  authController.logout();
                },
                fgColor: Colors.red,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
