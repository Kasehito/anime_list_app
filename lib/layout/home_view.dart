import 'package:anime_list_app/component/my_text.dart';
import 'package:anime_list_app/style/my_color.dart';
import 'package:anime_list_app/style/my_font.dart';
import 'package:flutter/material.dart';
import 'package:anime_list_app/layout/home/grid_view.dart';
import 'package:anime_list_app/model/anime_model.dart';
import 'package:anime_list_app/data/anime_data.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/pages/detail_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            MyText(
                text: 'Top Airing',
                textStyle: MyFonts.primaryFont(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: FutureBuilder<List<AnimeModel>>(
                future: AnimeData().fetchanimeList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                        color: MyColors.primaryColor);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No data available');
                  } else {
                    return AnimeGridView(
                      animes: snapshot.data!,
                      onAnimeTap: (anime) {
                        Get.to(() => DetailPage(
                            animes: snapshot.data!,
                            index: snapshot.data!.indexOf(anime)));
                      },
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: FutureBuilder<List<AnimeModel>>(
                future: AnimeData().fetchanimeList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                        color: MyColors.primaryColor);
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No data available');
                  } else {
                    return AnimeGridView(
                      animes: snapshot.data!,
                      onAnimeTap: (anime) {
                        Get.to(() => DetailPage(
                            animes: snapshot.data!,
                            index: snapshot.data!.indexOf(anime)));
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
