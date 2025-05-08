class MoviesGenresModel {
  final int id;
  final String name;
  MoviesGenresModel({required this.id, required this.name});
  factory MoviesGenresModel.fromJson(Map<String, dynamic> json) {
    return MoviesGenresModel(id: json['id'], name: json['name']);
  }

  @override
  String toString() {
    return "MoviesGenres( id: $id, name: $name)";
  }
}
