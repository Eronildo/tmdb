import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:tmdb/core/api/tmdb_api.dart';
import 'package:tmdb/core/models/movie_cast.dart';
import 'package:tmdb/core/models/movie_credits.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';
import 'package:tmdb/features/movie_cast/movie_cast_provider.dart';

class TmdbApiMock extends Mock implements TmdbApi {}

void main() {
  final tmbdApiMock = TmdbApiMock();

  const movieId = 653346;

  final dioException = DioException(requestOptions: RequestOptions());

  testProvider(
    'expect loading and empty movie casts when call getMovieCastsProvider',
    setUp: () =>
        when(() => tmbdApiMock.getMovieCredits(movieId: movieId)).thenAnswer(
      (_) async => MovieCredits(),
    ),
    overrides: [tmdbApiProvider.overrideWithValue(tmbdApiMock)],
    provider: getMovieCastsProvider(movieId: movieId),
    expect: () => <AsyncValue<List<MovieCast>>>[
      const AsyncLoading<List<MovieCast>>(),
      const AsyncData<List<MovieCast>>([]),
    ],
  );

  testProvider(
    'expect loading and error when call getMovieCastsProvider',
    setUp: () => when(() => tmbdApiMock.getMovieCredits(movieId: movieId))
        .thenThrow(dioException),
    overrides: [tmdbApiProvider.overrideWithValue(tmbdApiMock)],
    provider: getMovieCastsProvider(movieId: movieId),
    expect: () => [
      isA<AsyncLoading<List<MovieCast>>>(),
      isA<AsyncError<List<MovieCast>>>(),
    ],
  );
}
