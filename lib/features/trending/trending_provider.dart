import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/exceptions/no_internet_connection_exception.dart';
import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';

part 'trending_provider.g.dart';

@riverpod
Future<List<Movie>> getTrendingMovies(GetTrendingMoviesRef ref) async {
  final hasInternetConnection = await ref
      .watch(internetConnectionAdapterProvider)
      .hasInternetConnection();

  if (!hasInternetConnection) throw NoInternetConnectionException();
  
  final result = await ref.watch(tmdbApiProvider).getTrendingMovies();
  return result.movies;
}
