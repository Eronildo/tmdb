import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb/app/movie/widgets/movie_cast_list.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/providers/tmdb_provider.dart';
import 'package:tmdb/core/utils/utils.dart';
import 'package:tmdb/core/widgets/custom_app_bar.dart';
import 'package:tmdb/core/widgets/vote_widget.dart';

class MoviePage extends HookConsumerWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(selectMovieProvider);
    final source = ref.read(sourceProvider);

    final widthPercentage = MediaQuery.sizeOf(context).width / 100;

    final posterImage = CachedNetworkImageProvider(
      '${Constants.mediaUrl}${movie.posterPath}',
    );

    return FutureBuilder<Color>(
      future: Utils.getImagePalette(posterImage),
      builder: (context, snapshot) {
        final backgroundColor = snapshot.data ?? Colors.white;

        final textColor = backgroundColor.computeLuminance() > 0.179
            ? Colors.black
            : Colors.white;

        return Scaffold(
          appBar: const CustomAppBar(),
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: movie.backdropPath.isNotEmpty ||
                      movie.posterPath.isNotEmpty,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            '${Constants.backdropUrl}${movie.backdropPath}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (_, __, ___) => Container(
                          height: 45 * widthPercentage,
                          color: backgroundColor,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 45 * widthPercentage,
                          height: 45 * widthPercentage,
                          decoration: movie.backdropPath.isNotEmpty
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      backgroundColor,
                                      backgroundColor,
                                      Colors.transparent,
                                    ],
                                  ),
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        top: 1.5 * widthPercentage,
                        left: movie.backdropPath.isNotEmpty
                            ? 1.5 * widthPercentage
                            : (MediaQuery.sizeOf(context).width / 2) -
                                ((25 * widthPercentage) / 2),
                        child: Hero(
                          tag: '${movie.id}_$source',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: posterImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 25 * widthPercentage,
                            height: 37.5 * widthPercentage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: movie.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                          text: movie.releaseDate.isNotEmpty
                              ? ' (${DateTime.parse(movie.releaseDate).year})'
                              : '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VoteWidget(
                      voteAverage: movie.voteAverage,
                      size: VoteWidgetSize.large,
                    ),
                    const Gap(10),
                    Text(
                      'User Score',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  Utils.getGenresByIds(movie.genreIds),
                  style: TextStyle(color: textColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Overview',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(10),
                        Text(
                          movie.overview.isNotEmpty
                              ? movie.overview
                              : "We don't have an overview translated in English. Help us expand our database by adding one.",
                          style: TextStyle(color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          'Top Billed Cast',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MovieCastList(movie.id),
                      const Gap(20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
