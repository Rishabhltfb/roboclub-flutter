import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  //setter functions
  setTheme(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', darkMode);
  }

  //getter functions
  Future<bool> getThemepref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode');
  }

  setDeviceToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceToken', token);
  }

  //getter functions
  Future<String> getDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('deviceToken');
  }

  setOnboarding(bool isDone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarding', isDone);
  }

  //getter functions
  Future<bool> getOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding');
  }

  // clear local storage
  clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("darkMode");
  }
}
