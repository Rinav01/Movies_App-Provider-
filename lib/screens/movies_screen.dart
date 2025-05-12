import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';
import 'package:provider_state_managements/constants/my_theme_data.dart';
import 'package:provider_state_managements/screens/favourites_screen.dart';
import 'package:provider_state_managements/service/init_getit.dart';
import 'package:provider_state_managements/service/navigation_service.dart';
import 'package:provider_state_managements/view_models/movie_provider.dart';
import 'package:provider_state_managements/view_models/theme_provider.dart';
import '../widgets/movies/movies_widgets.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              getIt<NavigationService>().navigate(const FavouritesScreen());
            },
            icon: const Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),

          Consumer(
            builder: (context, ThemeProvider themeProvider, child) {
              return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.themeData == MyThemeData.darkTheme
                      ? MyAppIcons.lightTheme
                      : MyAppIcons.darkTheme,
                  // color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, MoviesProvider moviesProvider, child) {
          if (moviesProvider.isLoading && moviesProvider.moviesList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (moviesProvider.fetchMoviesError.isNotEmpty) {
            return Center(child: Text(moviesProvider.fetchMoviesError));
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent &&
                  !moviesProvider.isLoading) {
                moviesProvider.getMovies();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: moviesProvider.moviesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChangeNotifierProvider.value
                  (
                    value: moviesProvider.moviesList[index],
                    child: const MoviesWidget()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
