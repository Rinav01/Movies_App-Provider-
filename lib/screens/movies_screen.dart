import 'package:flutter/material.dart';
import 'package:provider/constants/my_app_constants.dart';
import 'package:provider/constants/my_app_icons.dart';
import 'package:provider/widgets/cached_image.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(MyAppIcons.favouriteRounded, color: Colors.red),
          ),

          IconButton(onPressed: () {}, icon: const Icon(MyAppIcons.darkTheme)),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedImageWidget(imageUrl: MyAppConstants.stockImage,),
          );
        },
      ),
    );
  }
}
