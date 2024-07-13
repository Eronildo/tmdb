# TMDB Project

<p>
<a href="https://www.themoviedb.org/"><img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_short-8e7b30f73a4020692ccca9c88bafe5dcb6f8a62a4c6bc55cd9ba82bb2cd95f6c.svg" height="100" alt="TMDB" /></a>
</p>

### The Movie Database Flutter project.

|Home Page|Movie 1|Movie 2|
|:-:|:-:|:-:|
|![Screenshot_1720885130](https://github.com/user-attachments/assets/9a74a3af-d90f-42e9-96cb-b1b96841f4f1)|![Screenshot_1720885102](https://github.com/user-attachments/assets/dd476836-62c2-483e-9927-611611a97608)|![Screenshot_1720885116](https://github.com/user-attachments/assets/2eddf49a-e8d4-4ec5-b47c-85ad74281f0d)|



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
