import 'package:flutter/material.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/models/movies_genres_model.dart';
import 'package:provider_state_managements/repository/movies_repo.dart';
import 'package:provider_state_managements/service/init_getit.dart';

class MoviesProvider with ChangeNotifier {
  final List<MovieModel> _moviesList = [];
  List<MovieModel> get moviesList => _moviesList;

  List<MoviesGenresModel> _genresList = [];
  List<MoviesGenresModel> get genresList => _genresList;

  int _currentPage = 1;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _fetchMoviesError = '';
  String get fetchMoviesError => _fetchMoviesError;

  final MoviesRepo _moviesRepo = getIt<MoviesRepo>();

  Future<void> getMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (genresList.isEmpty) {
        _genresList = await _moviesRepo.fetchGenres();
      }
      List<MovieModel> movies = await _moviesRepo.fetchMovies(
        page: _currentPage,
      );
      _moviesList.addAll(movies);
      _currentPage++;
      _fetchMoviesError = '';
    } catch (error) {
      print("error occured: $error");
      _fetchMoviesError = error.toString();
      notifyListeners();
      rethrow;
    } finally {
      _isLoading = true;
      notifyListeners();
    }
  }
}
