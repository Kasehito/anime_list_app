import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';
import 'package:anime_list_app/pages/detail_page.dart';
import 'package:anime_list_app/model/anime_model.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';

class AnimeListView extends StatelessWidget {
  final List<AnimeModel> animes;
  final Function(AnimeModel) onAnimeTap;
  final WatchlistController watchlistController = Get.find();

  AnimeListView({super.key, required this.animes, required this.onAnimeTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes[index];
          return SizedBox(
            height: 150, // Adjust the height of the container as needed
            child: GestureDetector(
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
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        anime.imageUrl ?? '',
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
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                anime.rating.toString(),
                                style: MyFonts.primaryFont(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            anime.genre ?? 'N/A',
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: MyFonts.primaryFont(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, right: 5),
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark),
                        onPressed: () {
                          watchlistController.addTask(anime);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
