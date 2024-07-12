import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb/app/home/widgets/movie_list_container.dart';
import 'package:tmdb/features/trending/trending_provider.dart';

class TrendingListWidget extends HookConsumerWidget {
  const TrendingListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovies = ref.watch(getTrendingMoviesProvider);

    return MovieListContainer(
      title: 'Trending',
      asyncMovies: asyncMovies,
    );
  }
}
