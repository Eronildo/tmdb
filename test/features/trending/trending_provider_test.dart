import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:tmdb/core/api/tmdb_api.dart';
import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/models/movies_response.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';
import 'package:tmdb/features/trending/trending_provider.dart';

class TmdbApiMock extends Mock implements TmdbApi {}

void main() {
  final tmbdApiMock = TmdbApiMock();

  final dioException = DioException(requestOptions: RequestOptions());

  testProvider(
    'expect loading and empty movies when call getTrendingMoviesProvider',
    setUp: () => when(() => tmbdApiMock.getTrendingMovies()).thenAnswer(
      (_) async => MoviesResponse(),
    ),
    overrides: [tmdbApiProvider.overrideWithValue(tmbdApiMock)],
    provider: getTrendingMoviesProvider,
    expect: () => <AsyncValue<List<Movie>>>[
      const AsyncLoading<List<Movie>>(),
      const AsyncData<List<Movie>>([]),
    ],
  );

  testProvider(
    'expect loading and error when call getTrendingMoviesProvider',
    setUp: () =>
        when(() => tmbdApiMock.getTrendingMovies()).thenThrow(dioException),
    overrides: [tmdbApiProvider.overrideWithValue(tmbdApiMock)],
    provider: getTrendingMoviesProvider,
    expect: () => [
      isA<AsyncLoading<List<Movie>>>(),
      isA<AsyncError<List<Movie>>>(),
    ],
  );
}
