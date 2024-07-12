import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/features/movie_cast/movie_cast_provider.dart';

class MovieCastList extends HookConsumerWidget {
  const MovieCastList(this.movieId, {super.key});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCastsAsync = ref.watch(getMovieCastsProvider(movieId: movieId));

    return movieCastsAsync.when(
      data: (casts) => casts.isEmpty
          ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "We don't have any cast added to this movie. You can help by adding some!",
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: casts
                        .map(
                          (cast) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              width: 125,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipPath(
                                      clipper: const ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${Constants.mediaUrl}${cast.profilePath}',
                                        height: 133,
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                        errorWidget: (_, __, ___) =>
                                            const ColoredBox(
                                          color: Color(0xffdbdbdb),
                                          child: Icon(
                                            Icons.person,
                                            color: Color(0xffb5b5b5),
                                            size: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cast.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(cast.character),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
      error: (error, stackTrace) => const Text('Error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
