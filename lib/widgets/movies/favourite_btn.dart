import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/view_models/favourites_provider.dart';

class FavouriteBtn extends StatelessWidget {
  const FavouriteBtn({super.key , required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, FavouritesProvider favouritesProvider, child) {
        return IconButton(
          onPressed: () {
            favouritesProvider.addOrRemoveFavourites(movieModel);
          },
          icon: Icon(
            favouritesProvider.isFavourite(movieModel)
                ? MyAppIcons.favouriteRounded
                : MyAppIcons.favouriteOutlineRounded,
            size: 20,
            color: favouritesProvider.isFavourite(movieModel) ? Colors.red : null,
          ),
        );
      },
    );
  }
}
