import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:flutter/material.dart';
import 'package:anime_list_app/model/anime_model.dart';

class AnimeGridView extends StatelessWidget {
  final List<AnimeModel> animes;
  final Function(AnimeModel) onAnimeTap;

  AnimeGridView({required this.animes, required this.onAnimeTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: animes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
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
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.secondaryLightColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      animes[index].imageUrl,
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          animes[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.primaryFont(
                            fontWeight: FontWeight.bold,
                          ),
                        )))
              ],
            ),
          ),
        );
      },
    );
  }
}
