import 'package:flutter/material.dart';
import 'package:anime_list_app/controller/anime_controller.dart'; // Import the Anime model

class AnimeDetailsPage extends StatelessWidget {
  final Anime anime;

  const AnimeDetailsPage({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(anime.posterUrl),
            const SizedBox(height: 16),
            Text(
              anime.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Add more details about the anime here
          ],
        ),
      ),
    );
  }
}
