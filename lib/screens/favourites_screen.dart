import 'package:flutter/material.dart';
import 'package:provider/constants/my_app_icons.dart';
import 'package:provider/widgets/movies/movies_widgets.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(MyAppIcons.delete, color: Colors.black),
          ),

          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.darkTheme)),
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
