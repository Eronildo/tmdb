import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/exceptions/no_internet_connection_exception.dart';
import 'package:tmdb/core/models/movie_cast.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';

part 'movie_cast_provider.g.dart';

@riverpod
Future<List<MovieCast>> getMovieCasts(GetMovieCastsRef ref,
    {required int movieId}) async {
  final hasInternetConnection = await ref
      .watch(internetCheckerProvider)
      .hasInternetConnection();

  if (!hasInternetConnection) throw NoInternetConnectionException();

  return (await ref.watch(tmdbApiProvider).getMovieCredits(movieId: movieId))
      .cast;
}
