class AnimeModel {
  final String title;
  final String? description;
  final String imageUrl;
  final String genre;
  final double rating;

  AnimeModel({
    required this.title,
    this.description,
    required this.imageUrl,
    required this.genre,
    required this.rating,
  });
}
