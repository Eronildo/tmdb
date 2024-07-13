import 'package:tmdb/core/adapters/http/http_client.dart';
import 'package:tmdb/core/models/movie_credits.dart';
import 'package:tmdb/core/models/movies_response.dart';

class TmdbApi {
  TmdbApi({required this.httpClient});

  final HttpClient httpClient;

  Future<MoviesResponse> searchMovie({required String query}) async {
    final response = await httpClient.get('/search/movie');
    return MoviesResponse.fromJson(response.data);
  }

  Future<MoviesResponse> getTrendingMovies() async {
    final response = await httpClient.get('/trending/movie/day');
    return MoviesResponse.fromJson(response.data);
  }

  Future<MoviesResponse> getPopularMovies() async {
    final response = await httpClient.get('/movie/popular');
    return MoviesResponse.fromJson(response.data);
  }

  Future<MovieCredits> getMovieCredits({required int movieId}) async {
    final response = await httpClient.get('/movie/$movieId/credits');
    return MovieCredits.fromJson(response.data);
  }
}
