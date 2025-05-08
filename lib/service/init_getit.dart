import 'package:get_it/get_it.dart';
import 'package:provider/repository/movies_repo.dart';
import 'package:provider/service/api_service.dart';
import 'package:provider/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<NavigationService>(()=>NavigationService());
  getIt.registerLazySingleton<ApiService>(()=>ApiService());
  getIt.registerLazySingleton<MoviesRepo>(()=>MoviesRepo(getIt<ApiService>()));
}
