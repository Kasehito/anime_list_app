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
          rating: 9.33,
          description:
              'The story of Frieren, an elf who has lived for over 1,000 years and is now on a journey to see the world, and her human companion, a former knight.'),
      AnimeModel(
          title: 'Steins;Gate',
          imageUrl: 'assets/SteinsGate.jpg',
          genre: 'Sci-Fi',
          rating: 9.12,
          description:
              'Steins;Gate follows an eclectic group of individuals who have the ability to send text messages to the past.'),
      AnimeModel(
          title: 'Shingeki no Kyojin',
          imageUrl: '',
          genre: 'Action',
          rating: 9.12,
          description:
              'Several hundred years ago, humans were nearly exterminated by Titans.'),
      AnimeModel(
          title: 'One Piece',
          imageUrl: '',
          genre: 'Action',
          rating: 8.58,
          description: 'One Piece follows the adventures of Monkey D. Luffy'),
    ];
  }
}