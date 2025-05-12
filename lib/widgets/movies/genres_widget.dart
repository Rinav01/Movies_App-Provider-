import 'package:flutter/material.dart';
import 'package:provider_state_managements/constants/my_app_constants.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/models/movies_genres_model.dart';
import 'package:provider_state_managements/utils/genre_utils.dart';

class GenresListWidget extends StatelessWidget {
  const GenresListWidget({super.key, required this.movieModel});

  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    List<MoviesGenresModel> movieGenres = GenreUtils.movieGenresNames(
      movieModel.genreIds ?? [] , context
    );
    return Wrap(
      children: List.generate(
        MyAppConstants.genres.length,
        (index) => chipWidget(
          genreName: MyAppConstants.genres[index],
          context: context,
        ),
      ),
    );
  }

  Widget chipWidget({
    required String genreName,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(color: Theme.of(context).colorScheme.surface),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
