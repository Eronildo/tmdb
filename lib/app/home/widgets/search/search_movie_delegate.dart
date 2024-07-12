import 'package:flutter/material.dart';
import 'package:tmdb/app/home/widgets/search/search_movie_list.dart';
import 'package:tmdb/core/models/movie.dart';

class SearchMovieDelegate extends SearchDelegate<Movie> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchMovieList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchMovieList(query: query);
  }
}
