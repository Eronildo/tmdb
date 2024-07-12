import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

sealed class Utils {
  static final List<(int, String)> _movieGenres = [
    (12, 'Adventure'),
    (28, 'Action'),
    (16, 'Animation'),
    (35, 'Comedy'),
    (80, 'Crime'),
    (99, 'Documentary'),
    (18, 'Drama'),
    (10751, 'Family'),
    (14, 'Fantasy'),
    (36, 'History'),
    (27, 'Horror'),
    (10402, 'Music'),
    (9648, 'Mystery'),
    (10749, 'Romance'),
    (878, 'Science Fiction'),
    (10770, 'TV Movie'),
    (53, 'Thriller'),
    (10752, 'War'),
    (37, 'Western'),
  ];

  /// Concat Genres in a String by Genre Ids
  static String getGenresByIds(List<int> genreIds) {
    var genres = '';

    for (final genrer in _movieGenres) {
      for (final id in genreIds) {
        if (genrer.$1 == id) genres += ', ${genrer.$2}';
      }
    }

    return genres.replaceFirst(', ', '');
  }

  // Calculate dominant color from ImageProvider
  static Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor?.color ?? Colors.white;
  }
}
