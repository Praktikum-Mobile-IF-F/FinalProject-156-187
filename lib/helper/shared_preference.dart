import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void setLogin(String username) async {
    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', true);
    getPref.setString('username', username);
  }

  void setLogout() async {
    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', false);
    getPref.remove('username');
  }

  Future<String> getUsername() async {
    SharedPreferences getPref = await _pref;
    String username = getPref.getString('username') ?? 'notFound';
    return username;
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences getPref = await _pref;
    bool loginStatus = getPref.getBool('isLogin') ?? false;
    return loginStatus;
  }

  // Tambahkan metode untuk mendapatkan daftar id favorit
  Future<List<String>> getFavoriteIds() async {
    SharedPreferences getPref = await _pref;
    List<String>? favorites = getPref.getStringList('favoriteIds');
    return favorites ?? [];
  }

  // Tambahkan metode untuk menyimpan daftar id favorit
  Future<void> setFavoriteIds(List<String> favorites) async {
    SharedPreferences getPref = await _pref;
    await getPref.setStringList('favoriteIds', favorites);
  }
}
