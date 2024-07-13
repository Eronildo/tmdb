import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/exceptions/no_internet_connection_exception.dart';
import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';

part 'search_provider.g.dart';

@riverpod
Future<List<Movie>> searchMovies(SearchMoviesRef ref,
    {required String query}) async {
      final hasInternetConnection = await ref
      .watch(internetCheckerProvider)
      .hasInternetConnection();

  if (!hasInternetConnection) throw NoInternetConnectionException();
  
  return (await ref.watch(tmdbApiProvider).searchMovie(query: query)).movies;
}
