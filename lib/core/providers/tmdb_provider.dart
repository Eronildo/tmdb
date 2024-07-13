import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/adapters/internet_connection_adapter.dart';
import 'package:tmdb/core/api/tmdb_api.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/models/movie.dart';

part 'tmdb_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef _) => Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        queryParameters: {
          'api_key': const String.fromEnvironment('API_KEY'),
        },
      ),
    );

@Riverpod(keepAlive: true)
TmdbApi tmdbApi(TmdbApiRef ref) => TmdbApi(dio: ref.watch(dioProvider));

@Riverpod(keepAlive: true)
InternetConnectionAdapter internetConnectionAdapter(
    InternetConnectionAdapterRef _) {
  return InternetConnectionAdapter();
}

final sourceProvider = StateProvider((_) => 'trending');

final selectMovieProvider = StateProvider<Movie>((_) => Movie.empty());
