import 'package:anime_list_app/binding/binding.dart';
import 'package:anime_list_app/controller/auth_controller.dart';
import 'package:anime_list_app/pages/bottom_nav.dart';
import 'package:anime_list_app/pages/login_page.dart';
import 'package:anime_list_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, secondary: Colors.white),
        useMaterial3: true,
      ),
      title: 'AnimeList',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/signup', page: () => SignupPage()),
        GetPage(name: '/home', page: () => const BottomNav()),
      ],
    );
  }
}
