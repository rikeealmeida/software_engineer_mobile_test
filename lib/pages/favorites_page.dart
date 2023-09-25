import 'package:desafio_software_engineer_mobileflutter/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Favorites', []),
      body: const Center(
        child: Text('Favorites Page'),
      ),
    );
  }
}
