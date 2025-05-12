import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_state_managements/constants/api_constants.dart';
import 'package:provider_state_managements/models/movie_model.dart';
import 'package:provider_state_managements/models/movies_genres_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/movie/popular?language=en-US&page=1",
    );
    final response = await http
        .get(url, headers: ApiConstants.headers)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // log("Data: $data");
      return List.from(
        data['results'].map((element) => MovieModel.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }

  Future<List<MoviesGenresModel>> fetchGenres() async {
    final url = Uri.parse(
      "${ApiConstants.baseUrl}/genre/movie/list?language=en",
    );
    final response =
        await http.get(url, headers: ApiConstants.headers).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // log("Data: $data");
      return List.from(
        data['genres'].map((element) => MoviesGenresModel.fromJson(element)),
      );
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}