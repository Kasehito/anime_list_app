import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:flutter/material.dart';
import 'package:anime_list_app/model/anime_model.dart';

class AnimeListView extends StatelessWidget {
  final List<AnimeModel> animes;
  final Function(AnimeModel) onAnimeTap;

  AnimeListView({required this.animes, required this.onAnimeTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          return Container(
              height:
                  150, // Adjust the height of the container to make the image higher
              child: GestureDetector(
                onTap: () => onAnimeTap(animes[index]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: MyColors.secondaryLightColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 2.0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  width: 400,
                  height: 500,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(
                          animes[index].imageUrl,
                          width: 200,
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              animes[index].title,
                              overflow: TextOverflow.fade,
                              style: MyFonts.primaryFont(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  animes[index].rating.toString(),
                                  style: MyFonts.primaryFont(),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              animes[index].genre,
                              overflow: TextOverflow.ellipsis,
                              style: MyFonts.primaryFont(),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5, right: 5),
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.bookmark_add),
                          onPressed: () => onAnimeTap(animes[index]),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
