import 'package:anime_list_app/model/anime_model.dart';
import 'package:get/get.dart';
import 'package:anime_list_app/data/anime_data.dart';
import 'package:anime_list_app/controller/watchlist_controller.dart';

class WatchController extends GetxController {
  var animeName = <AnimeModel>[].obs;
  var animeWatched = <AnimeModel>[].obs;

  WatchlistController watchlistController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchAnime();
  }

  void fetchAnime() async {
    var fetchedAnime = await AnimeData().fetchanimeList();
    animeName.assignAll(fetchedAnime);
  }

  void toggleWatched(AnimeModel anime) {
    if (animeWatched.contains(anime)) {
      watchlistController.deleteTask(animeName.indexOf(anime));
    } else {
      watchlistController.addTask(anime);
    }
  }

  bool isWatched(AnimeModel anime) {
    return animeWatched.contains(anime);
  }
}
