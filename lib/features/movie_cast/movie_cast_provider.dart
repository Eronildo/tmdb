import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/models/movie_cast.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';

part 'movie_cast_provider.g.dart';

@riverpod
Future<List<MovieCast>> getMovieCasts(GetMovieCastsRef ref,
    {required int movieId}) async {
  return (await ref.watch(tmdbApiProvider).getMovieCredits(movieId: movieId))
      .cast;
}
