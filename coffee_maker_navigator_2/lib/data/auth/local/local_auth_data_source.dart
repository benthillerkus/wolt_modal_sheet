import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthDataSource {
  final SharedPreferences sharedPreferences;

  LocalAuthDataSource({required this.sharedPreferences});

  static const String _isLoggedInKey = 'isLoggedIn';

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(_isLoggedInKey, isLoggedIn);
  }

  bool isUserLoggedIn() {
    return sharedPreferences.getBool(_isLoggedInKey) ?? false;
  }
}
