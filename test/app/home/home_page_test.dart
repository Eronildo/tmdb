import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nock/nock.dart';
import 'package:tmdb/app/home/home_page.dart';
import 'package:tmdb/app/home/widgets/movie_card.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/features/popular/popular_provider.dart';
import 'package:tmdb/features/trending/trending_provider.dart';

import '../../mocks/object_mocks.dart';

void main() {
  setUpAll(nock.init);

  setUp(() {
    nock.cleanAll();
  });

  testWidgets('render home page and load 4 movie cards ...', (tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    final movieList = ObjectMocks.movieList;

    for (final movie in movieList) {
      nock(Constants.mediaUrl).get(movie.posterPath).reply(404, {});
    }

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          getTrendingMoviesProvider.overrideWith((_) => movieList),
          getPopularMoviesProvider.overrideWith((_) => movieList),
        ],
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pump();

    final movieCards = find.byType(MovieCard);

    expect(movieCards, findsNWidgets(4));
  });
}

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("Unable to load asset"),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
