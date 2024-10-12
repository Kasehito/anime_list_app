class AnimeModel {
  final int? id;
  final String title;
  final String? description;
  final String imageUrl;
  final String? genre;
  final String? date;
  final double? rating;
  final bool? isAdded;

  AnimeModel({
    this.id,
    required this.title,
    this.description,
    this.date,
    required this.imageUrl,
    this.genre,
    this.rating,
    this.isAdded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'genre': genre,
      'rating': rating,
      'date': date,
      'isAdded': (isAdded ?? false) ? 1 : 0,
    };
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      title: map['title'],
      date: map['date'],
      description: map['description'],
      genre: map['genre'],
      rating: map['rating'],
      isAdded: map['isCompleted'] == 1,
    );
  }
}
