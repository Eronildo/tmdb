# TMDB Project

<p>
<a href="https://www.themoviedb.org/"><img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_short-8e7b30f73a4020692ccca9c88bafe5dcb6f8a62a4c6bc55cd9ba82bb2cd95f6c.svg" height="100" alt="TMDB" /></a>
</p>

### The Movie Database Flutter project.

## Challenge

Themoviedb layout should be used as a reference to create a movie listing page, where users can interact and access individual movie pages through cards. Movies must be populated in the system using themoviedb API and displayed according to the provided layout.

#### TMDB API

You must use the API Key from the TMDB API:

- https://developer.themoviedb.org/docs/getting-started


## Project execution
To run this project via command line make sure you are in the Mobile application root folder:
1. Create and add a '.env' file in the project root, fill in the variable values for the desired environment:
```
API_KEY=tmdb_api_key
```

2. Run the `flutter pub get` command to download the dependencies.
3. Run the `flutter pub run build_runner build --delete-conflicting-outputs` command to generate all freezed and riverpod files.
4. Run the command `flutter run --dart-define-from-file=.env` to run the application or use 'Start Debugging (F5)' from the 'Run and Debug' tab of Visual Studio Code if you are using it.
