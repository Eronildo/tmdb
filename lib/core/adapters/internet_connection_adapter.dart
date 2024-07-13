import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tmdb/core/adapters/internet_checker.dart';

class InternetConnectionAdapter extends InternetChecker {
  InternetConnectionAdapter() {
    _internetConnectionChecker = InternetConnectionChecker();
  }

  late final InternetConnectionChecker _internetConnectionChecker;

  @override
  Future<bool> hasInternetConnection() async =>
      await _internetConnectionChecker.hasConnection;
}
