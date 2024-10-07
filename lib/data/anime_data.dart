import 'package:anime_list_app/model/anime_model.dart';
import 'package:get/get.dart';

class AnimeData extends GetxController {
  Future<List<AnimeModel>> fetchanimeList() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      AnimeModel(
          title: 'Sousou no Frieren',
          imageUrl: 'assets/Frieren.jpg',
          genre: 'Drama',
          rating: 9.33),
      AnimeModel(
          title: 'Steins;Gate',
          imageUrl: 'assets/SteinsGate.jpg',
          genre: 'Sci-Fi',
          rating: 9.12),
    ];
  }
}
