import 'dart:convert';

import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/models/movies_response.dart';

import 'response_json_mocks.dart';

sealed class ObjectMocks {
  static List<Movie> get movieList =>
      MoviesResponse.fromJson(jsonDecode(ResponseJsonMocks.moviesResponseJson))
          .movies;
}
