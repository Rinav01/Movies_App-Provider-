import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';
import 'package:provider_state_managements/screens/favourites_screen.dart';
import 'package:provider_state_managements/service/init_getit.dart';
import 'package:provider_state_managements/service/navigation_service.dart';
import 'package:provider_state_managements/view_models/theme_provider.dart';
import '../widgets/movies/movies_widgets.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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

          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: const Icon(MyAppIcons.darkTheme),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MoviesWidget(),
          );
        },
      ),
    );
  }
}
