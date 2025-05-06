import 'package:flutter/material.dart';
import 'package:provider/constants/my_app_constants.dart';
import 'package:provider/constants/my_app_icons.dart';
import 'package:provider/screens/movie_details.dart';
import 'package:provider/service/init_getit.dart';
import 'package:provider/service/navigation_service.dart';
import 'package:provider/widgets/cached_image.dart';
import 'package:provider/widgets/movies/favourite_btn.dart';
import 'package:provider/widgets/movies/genres_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            //TODO: Navigate to movie details screen
            getIt<NavigationService>().navigate(const MovieDetailsScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: const CachedImageWidget(
                      imageUrl: MyAppConstants.stockImage,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Movie Title",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 5),
                            const Text("8/10"),
                          ],
                        ),
                        const SizedBox(width: 10),
                        //TODO: Add the genre widget
                        const GenresListWidget(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watch_later_outlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Release Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            FavouriteBtn(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
