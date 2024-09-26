import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'anime_details_page.dart';
import 'package:anime_list_app/controller/anime_controller.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeController controller = Get.find<AnimeController>();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.updateSearchText,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (controller.filteredAnimeList.isEmpty) {
                return Center(child: Text('No anime found'));
              }
              return ListView.builder(
                itemCount: controller.filteredAnimeList.length,
                itemBuilder: (context, index) {
                  final anime = controller.filteredAnimeList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add vertical spacing
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 100,
                        child: Image.network(
                          anime.posterUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(anime.name),
                      onTap: () {
                        Get.to(() => AnimeDetailsPage(anime: anime));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
