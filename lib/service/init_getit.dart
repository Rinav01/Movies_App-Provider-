import 'package:get_it/get_it.dart';
import 'package:provider/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<NavigationService>(()=>NavigationService());
}
