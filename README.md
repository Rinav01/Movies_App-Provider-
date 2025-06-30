# 🎬 Provider State Managements - Flutter Movie App

A modern Flutter application demonstrating scalable state management using the [Provider](https://pub.dev/packages/provider) package, dependency injection with [get_it](https://pub.dev/packages/get_it), and clean architecture principles. This app fetches and displays popular movies from [The Movie Database (TMDb)](https://www.themoviedb.org/) API, allows users to manage their favourites, and supports light/dark themes.

---

## 📚 Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [State Management](#state-management)
- [API Integration](#api-integration)
- [Theming](#theming)
- [Persistence](#persistence)
- [Extending the App](#extending-the-app)
- [Resources](#resources)
- [License](#license)

---

## ✨ Features

- **Popular Movies List:** Browse trending movies from TMDb.
- **Movie Details:** View detailed information about each movie.
- **Favourites:** Add or remove movies from your favourites list, persisted locally.
- **Genre Display:** See genres for each movie.
- **Infinite Scrolling:** Load more movies as you scroll.
- **Light/Dark Theme:** Toggle between light and dark modes.
- **Error Handling:** User-friendly error messages and retry options.
- **Clean Architecture:** Separation of concerns for maintainability.

---

## 🏗️ Architecture

This project follows a layered architecture:

- **Models:** Data structures for movies and genres.
- **Repository:** Handles data fetching and abstracts API logic.
- **Services:** API calls, navigation, and dependency injection.
- **ViewModels (Providers):** Business logic and state management.
- **Screens:** UI pages (Movies, Details, Favourites, Splash).
- **Widgets:** Reusable UI components.
- **Utils & Constants:** Utility functions and app-wide constants.

---

## 📁 Project Structure

```
lib/
├── main.dart
├── constants/           # App-wide constants (API, colors, icons, themes)
├── models/              # Movie and genre data models
├── repository/          # Movies repository (data abstraction)
├── screens/             # UI screens (movies, details, favourites, splash)
├── service/             # API, navigation, and DI setup
├── utils/               # Utility functions (e.g., genre mapping)
├── view_models/         # Providers for movies, favourites, theme
└── widgets/             # Reusable widgets (movie cards, error, etc.)
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- TMDb API Key and Bearer Token

### Installation

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd provider_state_managements
   ```

2. **Set up environment variables:**
   - Create a file at `assets/.env` with:
     ```
     MOVIES_API_KEY=your_tmdb_api_key
     MOVIES_BEARER_TOKEN=your_tmdb_bearer_token
     ```

3. **Install dependencies:**
   ```sh
   flutter pub get
   ```

4. **Run the app:**
   ```sh
   flutter run
   ```

---

## 🗂️ State Management

- Uses **Provider** for dependency injection and state management.
- `MoviesProvider` manages the movies list and genres.
- `FavouritesProvider` manages the user's favourite movies and persists them using `SharedPreferences`.
- `ThemeProvider` manages light/dark theme state and persists the user's choice.

---

## 🌐 API Integration

- All API calls are made via `ApiService` using TMDb endpoints.
- The `MoviesRepo` abstracts API logic and is injected using `get_it`.
- API keys and tokens are loaded securely from environment variables.

---

## 🎨 Theming

- Light and dark themes are defined in [`constants/my_theme_data.dart`](lib/constants/my_theme_data.dart).
- Users can toggle the theme from the app bar.
- Theme preference is persisted locally.

---

## 💾 Persistence

- Favourites and theme preferences are stored using [`SharedPreferences`](https://pub.dev/packages/shared_preferences).
- Data is loaded at app startup (see `SplashScreen`).

---

## 🧩 Extending the App

- Add more screens (e.g., search, user profile) by following the existing architecture.
- Integrate more features (e.g., movie reviews, ratings).
- Improve genre mapping in [`utils/genre_utils.dart`](lib/utils/genre_utils.dart).
- Add localization support.

---

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package](https://pub.dev/packages/provider)
- [get_it Package](https://pub.dev/packages/get_it)
- [TMDb API Docs](https://developer.themoviedb.org/docs)

---

## 📄 License

This project is licensed under the MIT License.

---

**Happy Coding!**
