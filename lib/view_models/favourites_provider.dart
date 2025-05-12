import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesProvider with ChangeNotifier {
  final List<MovieModel> _favouritesList = [];
  List<MovieModel> get favouritesList => _favouritesList;
  final FavKey = "favKey";

  bool isFavourite(MovieModel moviemodel) {
    return _favouritesList.any((movie) => movie.id == moviemodel.id);
  }

  Future<void> addOrRemoveFavourites(MovieModel moviemodel) async {
    if (isFavourite(moviemodel)) {
      _favouritesList.removeWhere((movie) => movie.id == moviemodel.id);
    } else {
      _favouritesList.add(moviemodel);
    }
    saveFavourites();
    notifyListeners();
  }

  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList =
        _favouritesList.map((movie) => json.encode(movie.toJson())).toList();
    prefs.setStringList(FavKey, stringList);
  }

  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(FavKey) ?? [];
    _favouritesList.clear();
    _favouritesList.addAll(
      stringList.map((movie) => MovieModel.fromJson(json.decode(movie))),
    );
    notifyListeners();
  }

  void clearAllFavs() {
    _favouritesList.clear();
    notifyListeners();
    saveFavourites();
  }
}
