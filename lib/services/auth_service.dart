
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static late final SharedPreferences _prefs;

  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> loginUser(String useraName) async {
    try {
      //SharedPreferences sharedUser = await _prefs;
      _prefs.setString("username", useraName);
    }catch(e){
      print(e);
    }
  }
  Future<bool> isLoggedIn() async{
    String? username = await _prefs.getString("username");
    if(username == null) return false;
    return true;
  }
  void logoutUser() {
    //SharedPreferences sharedUser = await _prefs;
    _prefs.clear();
  }
  String? getUsername() {
    //SharedPreferences sharedUser = await _prefs;
    return _prefs.getString("username") ?? "Default Value";
  }
}