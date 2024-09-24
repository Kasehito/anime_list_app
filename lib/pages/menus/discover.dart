import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '.../model/anime_model.dart';

class AnimeController extends GetxController {
  var animeList = <Anime>[].obs;
  var filteredAnimeList = <Anime>[].obs;  // List untuk hasil filter pencarian
  var isLoading = true.obs;
  var searchText = ''.obs;  // Untuk menyimpan teks pencarian

  @override
  void onInit() {
    fetchAnime();
    super.onInit();
  }

  void fetchAnime() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://api.example.com/anime'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var animes = (jsonData as List)
            .map((animeJson) => Anime.fromJson(animeJson))
            .toList();
        animeList.addAll(animes);
        filteredAnimeList.addAll(animes);  // Inisialisasi daftar terfilter
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Update filtered list berdasarkan searchText
  void updateSearchText(String text) {
    searchText.value = text;
    if (text.isEmpty) {
      filteredAnimeList.assignAll(animeList);  // Reset ke list asli jika kosong
    } else {
      filteredAnimeList.assignAll(
        animeList.where((anime) =>
            anime.name.toLowerCase().contains(text.toLowerCase())).toList(),
      );
    }
  }
}
