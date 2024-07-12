import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routefly/routefly.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/extensions/extensions.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';
import 'package:tmdb/features/search/search_provider.dart';

final _cardBorderRadius = BorderRadius.circular(6);

class SearchMovieList extends HookConsumerWidget {
  const SearchMovieList({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(searchMoviesProvider(query: query));

    return moviesAsync.when(
      data: (movies) => ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: index == 0 ? 20 : 10,
            ),
            child: Container(
              height: 141,
              decoration: BoxDecoration(
                borderRadius: _cardBorderRadius,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: Colors.black26,
                  ),
                ],
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: _cardBorderRadius,
                child: InkWell(
                  onTap: () {
                    ref.read(selectMovieProvider.notifier).state = movie;
                    Routefly.push('/movie/${movie.id}');
                  },
                  borderRadius: _cardBorderRadius,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: '${Constants.mediaUrl}${movie.posterPath}',
                        width: 94,
                        height: 141,
                        errorWidget: (_, __, ___) => const ColoredBox(
                          color: Color(0xffdbdbdb),
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: Color(0xffb5b5b5),
                              size: 55,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                movie.releaseDate.dateFormatLarge,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const Gap(20),
                              Flexible(
                                child: Text(
                                  movie.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      error: (error, stackTrace) => const Text('Error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
