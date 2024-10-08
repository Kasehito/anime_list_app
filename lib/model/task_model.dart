class TaskModel {
  int? id;
  String? title;
  String? description;
  String? imageUrl;
  String? genre;
  double? rating;

  TaskModel({this.id, this.title, this.description, this.imageUrl, this.genre, this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'genre': genre,
      'rating': rating,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> Map) {
    return TaskModel(
      id: Map['id'],
      title: Map['title'],
      description: Map['description'],
      imageUrl: Map['imageUrl'],
      genre: Map['genre'],
      rating: Map['rating'],
    );
  }
}
