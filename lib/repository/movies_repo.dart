import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/models/movies_genres_model.dart';
import 'package:provider_state_managements/service/api_service.dart';

class MoviesRepo {
  final ApiService _apiService;
  MoviesRepo(this._apiService);

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  Future<List<MoviesGenresModel>> fetchGenres() async {
    return await _apiService.fetchGenres();
  }
}
