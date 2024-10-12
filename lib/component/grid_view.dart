import 'package:anime_list_app/pages/detail_page.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:flutter/material.dart';
import 'package:anime_list_app/model/anime_model.dart';
import 'package:get/get.dart';

class AnimeGridView extends StatelessWidget {
  final List<AnimeModel> animes;
  final Function(AnimeModel) onAnimeTap;

  const AnimeGridView(
      {super.key, required this.animes, required this.onAnimeTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: animes.length,
          itemBuilder: (context, index) {
            return Container(
              // Adjust the height of the container to make the image higher
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
                  width: 200,
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          animes[index].imageUrl,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    animes[index].title,
                                    overflow: TextOverflow.fade,
                                    maxLines:
                                        2, // Ensure the text is constrained to one line
                                    softWrap: false, // Prevent wrapping
                                    style: MyFonts.primaryFont(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    animes[index].genre ?? 'N/A',
                                    overflow: TextOverflow.fade,
                                    maxLines:
                                        1, // Ensure the text is constrained to one line
                                    softWrap: false, // Prevent wrapping
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: MyColors.primaryColor,
                                        size: 16.0,
                                      ),
                                      Text(
                                        animes[index].rating.toString(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 5, right: 5),
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: const Icon(Icons.bookmark_add),
                                onPressed: () => onAnimeTap(animes[index]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
