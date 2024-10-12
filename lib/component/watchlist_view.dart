import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:anime_list_app/style/my_color.dart';

class WatchlistView extends StatelessWidget {
  final WatchlistController watchlistController =
      Get.put(WatchlistController()); // Pastikan controller diinisialisasi

  WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    // Memastikan data dimuat dari database
    watchlistController.loadTasks();

    return Obx(() {
      if (watchlistController.data.isEmpty) {
        return const Center(child: Text("No anime in your watchlist."));
      } else {
        return ListView.builder(
          itemCount: watchlistController.data.length,
          itemBuilder: (context, index) {
            final anime = watchlistController.data[index];

            return SizedBox(
              height:
                  150, // Adjust the height of the container to make the image higher
              child: GestureDetector(
                onTap: () {
                  // Detail page atau action yang diinginkan saat anime di-tap
                  print("Tapped on: ${anime.title}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: MyColors.secondaryLightColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 2.0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  width: 400,
                  height: 150,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          anime.imageUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              anime.title,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: MyFonts.primaryFont(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, right: 5),
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.bookmark_remove,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            watchlistController.deleteTask(anime.id!);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
