import 'package:flutter/material.dart';
import 'package:anime_list_app/model/anime_model.dart';
import 'package:anime_list_app/data/anime_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final List<AnimeModel> animes;
  final AnimeData animeData = AnimeData();
  final int index;
  DetailPage({super.key, required this.animes, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SvgPicture.asset(
            'assets/Animelist.svg', // Path to your logo
            fit: BoxFit.contain,
            height: 100,
            placeholderBuilder: (context) => const Text(
                'Kyun Animelist'), // Placeholder text if image fails to load
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Get.to(const ProfilePage());
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  animes[index].imageUrl,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
