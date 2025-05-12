import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';
import 'package:provider_state_managements/view_models/favourites_provider.dart';
import 'package:provider_state_managements/widgets/movies/movies_widgets.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouritesProvider = Provider.of<FavouritesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Movies"),
        actions: [
          IconButton(
            onPressed: () {
              favouritesProvider.clearAllFavs();
            },
            icon: const Icon(MyAppIcons.delete, color: Colors.red),
          ),

          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.darkTheme)),
        ],
      ),
      body:
          favouritesProvider.favouritesList.isEmpty
              ? Center(child: Text("No Favourites Added",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
              : ListView.builder(
                itemCount: favouritesProvider.favouritesList.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value:
                        favouritesProvider.favouritesList.reversed
                            .toList()[index],
                    child: MoviesWidget(),
                  );
                },
              ),
    );
  }
}
