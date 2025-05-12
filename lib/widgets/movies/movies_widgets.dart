import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/constants/my_app_icons.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/screens/movie_details.dart';
import 'package:provider_state_managements/service/init_getit.dart';
import 'package:provider_state_managements/service/navigation_service.dart';
import 'package:provider_state_managements/widgets/cached_image.dart';
import 'package:provider_state_managements/widgets/movies/favourite_btn.dart';
import 'package:provider_state_managements/widgets/movies/genres_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({
    super.key,
    // required this.moviesModel
  });

  // final MovieModel moviesModel;

  @override
  Widget build(BuildContext context) {
    final moviesModelProvider = Provider.of<MovieModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {
            getIt<NavigationService>().navigate(ChangeNotifierProvider.value(
              value: moviesModelProvider,
              child: const MovieDetailsScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: moviesModelProvider.id ?? 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedImageWidget(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500/${moviesModelProvider.backdropPath}",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          moviesModelProvider.title ?? "No Title",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 5),
                            Text(
                              "${moviesModelProvider.voteAverage?.toStringAsFixed(1)}/10",
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        
                        GenresListWidget(movieModel: moviesModelProvider,),
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
                            Text(
                              moviesModelProvider.releaseDate ?? "No Release Date",
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
