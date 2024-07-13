import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb/core/adapters/http/http_client.dart';
import 'package:tmdb/core/adapters/http/models/http_response.dart';
import 'package:tmdb/core/api/tmdb_api.dart';

import '../../mocks/response_json_mocks.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late final HttpClientMock dioMock;
  late final TmdbApi tmdbApi;

  setUpAll(
    () {
      dioMock = HttpClientMock();
      tmdbApi = TmdbApi(httpClient: dioMock);
    },
  );

  void whenHttpGetSuccess(String dataJson) {
    when(() => dioMock.get(any())).thenAnswer(
      (_) async => HttpResponse(
        data: jsonDecode(dataJson),
        statusCode: 200,
      ),
    );
  }

  void whenHttpGetFailure() {
    when(() => dioMock.get(any())).thenThrow(Exception());
  }

  group(
    'TMDB API Requests with Success',
    () {
      test('Search movies must return 1 movie', () async {
        // Arrange:
        const query = 'Jhon';
        whenHttpGetSuccess(ResponseJsonMocks.searchResponseJson);

        // Act:
        final moviesResponse = await tmdbApi.searchMovie(query: query);

        // Assert:
        expect(moviesResponse.movies, isNotEmpty);
        expect(moviesResponse.movies.length, 1);
      });

      test('Get trending movies must return 2 movies', () async {
        // Arrange:
        whenHttpGetSuccess(ResponseJsonMocks.moviesResponseJson);

        // Act:
        final moviesResponse = await tmdbApi.getTrendingMovies();

        // Assert:
        expect(moviesResponse.movies, isNotEmpty);
        expect(moviesResponse.movies.length, 2);
      });

      test('Get popular movies, the last movie title must be "The Convert"',
          () async {
        // Arrange:
        whenHttpGetSuccess(ResponseJsonMocks.moviesResponseJson);

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
        whenHttpGetSuccess(ResponseJsonMocks.movieCreditsResponseJson);

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
          whenHttpGetFailure();

          // Act:
          final future = tmdbApi.getTrendingMovies();

          // Assert:
          expect(() => future, throwsA(isA<Exception>()));
        },
      );
    },
  );
}
