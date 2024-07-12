import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';

part 'popular_provider.g.dart';

@riverpod
Future<List<Movie>> getPopularMovies(GetPopularMoviesRef ref) async {
  final result = await ref.watch(tmdbApiProvider).getPopularMovies();
  return result.movies;
}
