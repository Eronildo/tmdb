import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb/core/adapters/http/dio_adapter.dart';
import 'package:tmdb/core/adapters/http/http_client.dart';
import 'package:tmdb/core/adapters/internet_connection/internet_checker.dart';
import 'package:tmdb/core/adapters/internet_connection/internet_connection_adapter.dart';
import 'package:tmdb/core/api/tmdb_api.dart';
import 'package:tmdb/core/models/movie.dart';

part 'tmdb_provider.g.dart';

@Riverpod(keepAlive: true)
HttpClient httpClient(HttpClientRef ref) => DioClientAdapter();

@Riverpod(keepAlive: true)
TmdbApi tmdbApi(TmdbApiRef ref) =>
    TmdbApi(httpClient: ref.watch(httpClientProvider));

@Riverpod(keepAlive: true)
InternetChecker internetChecker(InternetCheckerRef _) =>
    InternetConnectionAdapter();

final sourceProvider = StateProvider((_) => 'trending');

final selectMovieProvider = StateProvider<Movie>((_) => Movie.empty());
