import 'package:flutter/material.dart';
import 'package:provider/constants/my_app_icons.dart';

class FavouriteBtn extends StatelessWidget {
  const FavouriteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //TODO: implement favourite button functionality
      },
      icon: const Icon(MyAppIcons.favouriteOutlineRounded, size: 20),
    );
  }
}
