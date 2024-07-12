import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routefly/routefly.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/extensions/extensions.dart';
import 'package:tmdb/core/models/movie.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';
import 'package:tmdb/core/widgets/vote_widget.dart';

class MovieCard extends HookConsumerWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.source,
  });

  final Movie movie;
  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(selectMovieProvider.notifier).state = movie;
        ref.read(sourceProvider.notifier).state = source;
        Routefly.push('/movie/${movie.id}');
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 26),
                  child: Hero(
                    tag: '${movie.id}_$source',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            '${Constants.mediaUrl}${movie.posterPath}',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: 150,
                      height: 225,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: VoteWidget(voteAverage: movie.voteAverage),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    movie.releaseDate.dateFormat,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
