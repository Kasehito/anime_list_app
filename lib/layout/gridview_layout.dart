import 'package:anime_list_app/model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/pages/detail_page.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';

class GridviewLayout extends StatelessWidget {
  final List<AnimeModel> animes;
  final Function(AnimeModel) onAnimeTap;

  GridviewLayout({super.key, required this.animes, required this.onAnimeTap});

  final WatchlistController watchlistController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7, // Adjusted aspect ratio for smaller cards
          ),
          itemCount: animes.length,
          itemBuilder: (context, index) {
            final anime = animes[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailPage(animes: animes, index: index));
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        anime.imageUrl,
                        width: double.infinity,
                        height: 120, // Adjusted height for smaller image
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: MyFonts.primaryFont(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            anime.genre ?? 'N/A',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: MyFonts.primaryFont(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: MyColors.primaryColor,
                                size: 16.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                anime.rating.toString(),
                                style: MyFonts.primaryFont(
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              icon: const Icon(Icons.bookmark_outline),
                              onPressed: () {
                                watchlistController.addTask(anime);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
