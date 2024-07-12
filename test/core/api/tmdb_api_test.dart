import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/core/api/tmdb_api.dart';

import '../../mocks/response_json_mocks.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late final DioMock dioMock;
  late final TmdbApi tmdbApi;

  setUpAll(
    () {
      dioMock = DioMock();
      tmdbApi = TmdbApi(dio: dioMock);
    },
  );

  void whenDioGetSuccess(String dataJson) {
    when(() => dioMock.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        data: jsonDecode(dataJson),
        statusCode: 200,
      ),
    );
  }

  void whenDioGetFailure() {
    when(() => dioMock.get(any())).thenThrow(
      DioException(
        requestOptions: RequestOptions(),
      ),
    );
  }

  group(
    'TMDB API Requests with Success',
    () {
      test('Search movies must return 1 movie', () async {
        // Arrange:
        const query = 'Jhon';
        whenDioGetSuccess(ResponseJsonMocks.searchResponseJson);

        // Act:
        final moviesResponse = await tmdbApi.searchMovie(query: query);

        // Assert:
        expect(moviesResponse.movies, isNotEmpty);
        expect(moviesResponse.movies.length, 1);
      });

      test('Get trending movies must return 2 movies', () async {
        // Arrange:
        whenDioGetSuccess(ResponseJsonMocks.moviesResponseJson);

        // Act:
        final moviesResponse = await tmdbApi.getTrendingMovies();

        // Assert:
        expect(moviesResponse.movies, isNotEmpty);
        expect(moviesResponse.movies.length, 2);
      });

      test('Get popular movies, the last movie title must be "The Convert"',
          () async {
        // Arrange:
        whenDioGetSuccess(ResponseJsonMocks.moviesResponseJson);

        // Act:
        final moviesResponse = await tmdbApi.getPopularMovies();

        // Assert:
        expect(moviesResponse.movies, isNotEmpty);
        expect(moviesResponse.movies.length, 2);
        expect(moviesResponse.movies.last.title, 'The Convert');
      });

      test('Get movie credits must return 3 casts', () async {
        // Arrange:
        const movieId = 653346;
        whenDioGetSuccess(ResponseJsonMocks.movieCreditsResponseJson);

        // Act:
        final creditsResponse = await tmdbApi.getMovieCredits(movieId: movieId);

        // Assert:
        expect(creditsResponse.cast, isNotEmpty);
        expect(creditsResponse.cast.length, 3);
      });
    },
  );

  group(
    'TMDB API Requests with Failure',
    () {
      test(
        'Try get trending movies throws a DioException',
        () async {
          // Arrange:
          whenDioGetFailure();

          // Act:
          final future = tmdbApi.getTrendingMovies();

          // Assert:
          expect(() => future, throwsA(isA<DioException>()));
        },
      );
    },
  );
}
