import 'package:desafio_software_engineer_mobileflutter/services/local_db.dart';
import 'package:flutter/material.dart';

class FavoriteStore extends ValueNotifier<List<String>> {
  FavoriteStore(super.value);
  final dbService = LocalDBService();
  final favorites = [];

  Future<void> getFavorites() async {
    value = await dbService.getFavorites();
  }

  Future<void> saveFavorite(int id) async {
    await dbService.saveProductToFavorites(id.toString());
    await getFavorites();
  }

  Future<void> removeFavorite(int id) async {
    await dbService.removeProductFromFavorites(id.toString());
    await getFavorites();
  }
}
