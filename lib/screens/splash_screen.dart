import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/screens/movies_screen.dart';
import 'package:provider_state_managements/service/init_getit.dart';
import 'package:provider_state_managements/service/navigation_service.dart';
import 'package:provider_state_managements/view_models/favourites_provider.dart';
import 'package:provider_state_managements/view_models/movie_provider.dart';
import 'package:provider_state_managements/widgets/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Future<void> _loadInitialData(BuildContext context) async {
    await Future.microtask(() async {
      if (!context.mounted) return;
      await Provider.of<MoviesProvider>(context, listen: false).getMovies();

      if (!context.mounted) return;
      await Provider.of<FavouritesProvider>(context, listen: false).loadFavourites();
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<MoviesProvider>(context, listen: false).getMovies();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: _loadInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          } else if (snapshot.hasError) {
            if (moviesProvider.genresList.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                getIt<NavigationService>().navigateReplace(MoviesScreen());
              });
            }
            return Provider.of<MoviesProvider>(context).isLoading
            ?const Center(
              child: CircularProgressIndicator.adaptive(),
            )
            :MyErrorWidget(
              errorText: snapshot.error.toString(),
              retryFunction: () async {
                _loadInitialData(context);
              },
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              getIt<NavigationService>().navigateReplace(MoviesScreen());
            });
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
