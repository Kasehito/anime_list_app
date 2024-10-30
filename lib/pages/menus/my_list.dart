import 'package:anime_list_app/layout/watchlist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';

class MyListPage extends StatelessWidget {
  final WatchlistController watchlistController =
      Get.put(WatchlistController());

  MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure tasks are loaded when the widget is built
    watchlistController.loadTasks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Anime List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Obx(() {
              if (watchlistController.data.isEmpty) {
                return const Center(
                  child: Text('No anime in the list.'),
                );
              } else {
                return WatchlistView();
              }
            }),
          ),
        ],
      ),
    );
  }
}
