import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:tmdb/app/home/widgets/popular_list_widget.dart';
import 'package:tmdb/app/home/widgets/search/search_movie_delegate.dart';
import 'package:tmdb/app/home/widgets/trending_list_widget.dart';
import 'package:tmdb/core/widgets/custom_app_bar.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: SearchBar(
                controller: searchController,
                hintText: 'Search...',
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                trailing: [
                  InkWell(
                    onTap: () async {
                      await showSearch(
                        context: context,
                        delegate: SearchMovieDelegate(),
                        query: searchController.text,
                      );
                      searchController.clear();
                    },
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    splashColor: Colors.red,
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          stops: [0, .56, 1],
                          colors: [
                            Color(0xff90cea1),
                            Color(0xff3cbec9),
                            Color(0xff00b3e5),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TrendingListWidget(),
            const Gap(20),
            const PopularListWidget(),
          ],
        ),
      ),
    );
  }
}
