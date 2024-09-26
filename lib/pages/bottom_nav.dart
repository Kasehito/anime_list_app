import 'package:anime_list_app/pages/menus/discover.dart';
import 'package:anime_list_app/pages/menus/homepage.dart';
import 'package:anime_list_app/pages/menus/my_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    //connect UI Controller
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    final List<Widget> menus = [
      const HomePage(), // Home
      const Discover(), // Discover
      const MyListPage(), // My List
    ];

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Bottom Navigation'),
          ),
          body: Center(
            child: menus.elementAt(bottomNavController.currentIndex.value),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomNavController.currentIndex.value,
            onTap: (index) {
              bottomNavController.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
