import 'package:anime_list_app/model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:anime_list_app/data/anime_data.dart';
import 'package:anime_list_app/component/grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 250,
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
                      return AnimeGridView(
                        animes: snapshot.data!,
                        onAnimeTap: (anime) {
                          print(anime.title);
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
