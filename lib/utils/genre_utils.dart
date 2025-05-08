

import 'package:provider_state_managements/models/movies_genres_model.dart';
import 'package:provider_state_managements/repository/movies_repo.dart';
import 'package:provider_state_managements/service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenresModel> movieGenresNames(List<int> genreIds) {
    final movieRepository = getIt<MoviesRepo>();
    final cachedGenres = [];//TODO: Replace with the actual cached genres list
    List<MoviesGenresModel> genresNames = [];
    for (var genreId in genreIds) {
      var genre = cachedGenres.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenresModel(id: 5448484, name: 'Unknown'),
      );
      genresNames.add(genre);
    }
    return genresNames;
  }
}
