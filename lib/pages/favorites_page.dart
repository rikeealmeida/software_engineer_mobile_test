import 'package:desafio_software_engineer_mobileflutter/components/empty_list_dialog.dart';
import 'package:desafio_software_engineer_mobileflutter/components/product_card.dart';
import 'package:desafio_software_engineer_mobileflutter/states/favorites_store.dart';
import 'package:desafio_software_engineer_mobileflutter/states/product_store.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final ProductStore productStore = ProductStore([]);
  final FavoriteStore favoriteStore = FavoriteStore([]);

  @override
  void initState() {
    super.initState();
    favoriteStore.getFavorites();
    productStore.getFavoriteProducts();
    favoriteStore.addListener(() {
      setState(() {});
    });
    productStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: productStore.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : productStore.value.isEmpty
                ? const EmptyListDialog()
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: productStore.value.length,
                    itemBuilder: (context, index) {
                      var product = productStore.value[index];
                      var isFavorite =
                          favoriteStore.value.contains(product.id.toString());
                      return ProductCard(
                        isFromFavoritePage: true,
                        navigatorCallback: (v) {
                          favoriteStore.getFavorites();
                          productStore.getFavoriteProducts();
                        },
                        isFavorite: isFavorite,
                        onTap: () async {
                          if (isFavorite) {
                            await favoriteStore.removeFavorite(product.id!);
                          } else {
                            await favoriteStore.saveFavorite(product.id!);
                          }
                        },
                        product: product,
                      );
                    }));
  }
}
