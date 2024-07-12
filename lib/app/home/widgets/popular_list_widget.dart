import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb/app/home/widgets/movie_list_container.dart';
import 'package:tmdb/features/popular/popular_provider.dart';

class PopularListWidget extends HookConsumerWidget {
  const PopularListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovies = ref.watch(getPopularMoviesProvider);

    return MovieListContainer(
      title: 'Popular',
      asyncMovies: asyncMovies,
    );
  }
}
