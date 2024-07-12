import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tmdb/app/home/widgets/movie_card.dart';
import 'package:tmdb/core/constants/constants.dart';
import 'package:tmdb/core/models/movie.dart';

class MovieListContainer extends StatelessWidget {
  const MovieListContainer({
    super.key,
    required this.title,
    required this.asyncMovies,
  });

  final String title;
  final AsyncValue<List<Movie>> asyncMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        asyncMovies.when(
          data: (data) => Stack(
            children: [
              Visibility(
                visible: title == 'Trending',
                child: Positioned(
                  bottom: -60,
                  child: SvgPicture.asset(
                    Constants.trendingBackground,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 307,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(20),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 40 : 0,
                        right: index == data.length - 1 ? 40 : 0,
                      ),
                      child: MovieCard(movie: data[index], source: title),
                    ),
                  ),
                ),
              ),
            ],
          ),
          error: (error, stackTrace) => const Text('Error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
