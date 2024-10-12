import 'package:anime_list_app/component/list_view.dart';
import 'package:anime_list_app/data/anime_data.dart';
import 'package:anime_list_app/model/anime_model.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<AnimeModel>>(
          future: AnimeData().fetchanimeList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
              return AnimeListView(
                animes: snapshot.data!,
                onAnimeTap: (anime) {
                  print(anime.title);
                },
              );
            }
          },
        ),
      ),
    );
  }
}