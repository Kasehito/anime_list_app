import 'package:get/get.dart';

class Anime {
  final String name;
  final String posterUrl;

  Anime({required this.name, required this.posterUrl});
}

class AnimeController extends GetxController {
  var animeList = <Anime>[].obs;
  var filteredAnimeList = <Anime>[].obs;
  var isLoading = true.obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void fetchAnime() async {
    try {
      isLoading(true);
      // Data anime statis
      var animes = [
        Anime(
            name: 'Naruto',
            posterUrl:
                'https://upload.wikimedia.org/wikipedia/id/thumb/a/ad/Naruto_-_Shippuden_DVD_season_1_volume_1.jpg/330px-Naruto_-_Shippuden_DVD_season_1_volume_1.jpg'),
        Anime(
            name: 'One Piece',
            posterUrl:
                'https://upload.wikimedia.org/wikipedia/id/9/90/One_Piece%2C_Volume_61_Cover_%28Japanese%29.jpg'),
        Anime(
            name: 'Attack on Titan',
            posterUrl:
                'https://upload.wikimedia.org/wikipedia/id/b/bb/Attack_on_Titan_Season_1_vol_1.jpg'),
        // Tambahkan data anime lainnya di sini
      ];
      animeList.addAll(animes);
      filteredAnimeList.addAll(animes);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void updateSearchText(String text) {
    searchText.value = text;
    if (text.isEmpty) {
      filteredAnimeList.assignAll(animeList);
    } else {
      filteredAnimeList.assignAll(
        animeList
            .where((anime) =>
                anime.name.toLowerCase().contains(text.toLowerCase()))
            .toList(),
      );
    }
  }
}
