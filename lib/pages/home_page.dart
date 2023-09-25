import 'package:desafio_software_engineer_mobileflutter/components/custom_search_field.dart';
import 'package:desafio_software_engineer_mobileflutter/components/empty_list_dialog.dart';
import 'package:desafio_software_engineer_mobileflutter/components/product_card.dart';
import 'package:desafio_software_engineer_mobileflutter/pages/favorites_page.dart';
import 'package:desafio_software_engineer_mobileflutter/states/favorites_store.dart';
import 'package:desafio_software_engineer_mobileflutter/states/product_store.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final ProductStore productStore = ProductStore([]);
  final FavoriteStore favoriteStore = FavoriteStore([]);
  @override
  void initState() {
    super.initState();
    productStore.getProducts();
    productStore.addListener(() {
      setState(() {});
    });
    favoriteStore.getFavorites();
    favoriteStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            IconButton(
              tooltip: 'Favorites',
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const FavoritesPage()))
                  .then(
                    (value) => favoriteStore.getFavorites(),
                  ),
              icon: const Icon(Icons.favorite_outline),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSearchField(
                controller: controller,
                onChange: (v) {
                  productStore.filterProducts(v);
                },
              ),
              Expanded(
                child: productStore.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : productStore.value.isEmpty
                        ? const EmptyListDialog()
                        : ListView.separated(
                            padding: const EdgeInsets.only(top: 20),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: productStore.value.length,
                            itemBuilder: (context, index) {
                              var product = productStore.value[index];
                              var isFavorite = favoriteStore.value
                                  .contains(product.id.toString());
                              return ProductCard(
                                isFromFavoritePage: false,
                                navigatorCallback: (value) =>
                                    favoriteStore.getFavorites(),
                                onTap: () async {
                                  if (isFavorite) {
                                    await favoriteStore
                                        .removeFavorite(product.id!);
                                  } else {
                                    await favoriteStore
                                        .saveFavorite(product.id!);
                                  }
                                },
                                isFavorite: isFavorite,
                                product: product,
                              );
                            },
                          ),
              ),
            ],
          ),
        ));
  }
}
