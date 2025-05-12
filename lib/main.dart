import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_managements/screens/splash_screen.dart';
import 'package:provider_state_managements/service/init_getit.dart';
import 'package:provider_state_managements/service/navigation_service.dart';
import 'package:provider_state_managements/view_models/favourites_provider.dart';
import 'package:provider_state_managements/view_models/movie_provider.dart';
import 'package:provider_state_managements/view_models/theme_provider.dart';

void main() {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MoviesProvider>(create: (_) => MoviesProvider()),
        ChangeNotifierProvider<FavouritesProvider>(create: (_) => FavouritesProvider()),
      ],
      child: Consumer(
        builder: (context , ThemeProvider themeProvider, child) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            theme: themeProvider.themeData,
            home: SplashScreen(),
          );
        }
      ),
    );
  }
}
