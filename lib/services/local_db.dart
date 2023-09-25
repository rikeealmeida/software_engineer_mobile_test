import 'package:shared_preferences/shared_preferences.dart';

class LocalDBService {
  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites')!;
  }

  Future<void> saveProductToFavorites(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? oldFavorites = prefs.getStringList('favorites');
    prefs.setStringList('favorites', [...oldFavorites!, id]);
  }

  Future<void> removeProductFromFavorites(String id) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites');
    favorites!.removeWhere((favorite) => favorite == id);
    prefs.setStringList('favorites', favorites);
  }
}
