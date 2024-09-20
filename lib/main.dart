import 'package:anime_list_app/pages/bottom_nav.dart';
import 'package:anime_list_app/pages/login_page.dart';
import 'package:anime_list_app/pages/menus/homepage.dart';
import 'package:anime_list_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, secondary: Colors.white),
        useMaterial3: true,
      ),
      title: 'AnimeList',
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/singup', page: () => SignupPage()),
        GetPage(name: '/home', page: () => BottomNav()),
      ],
    );
  }
}
