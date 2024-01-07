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
            : favoriteStore.value.isEmpty
                ? const EmptyListDialog()
                : Column(
                    children: [
                      Text(favoriteStore.value.length.toString()),
                      ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: productStore.value.length,
                          itemBuilder: (context, index) {
                            var product = productStore.value[index];
                            var isFavorite = favoriteStore.value
                                .contains(product.id.toString());

                            return Dismissible(
                                key: ValueKey(product.id),
                                confirmDismiss: (v) async {
                                  bool _value = false;
                                  await showDialog<bool>(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Deseja remover o item?"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    _value = true;
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Sim"),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    _value = false;
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Não"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  return _value;
                                },
                                onDismissed: (v) async {
                                  favoriteStore.removeFavorite(product.id ?? 0);
                                  // setState(() {
                                  //   favoriteStore.value.removeAt(index);
                                  // });
                                },
                                child: ProductCard(
                                  isFromFavoritePage: true,
                                  navigatorCallback: (v) {
                                    favoriteStore.getFavorites();
                                    productStore.getFavoriteProducts();
                                  },
                                  isFavorite: isFavorite,
                                  onTap: () async {
                                    if (isFavorite) {
                                      await favoriteStore
                                          .removeFavorite(product.id!);
                                    } else {
                                      await favoriteStore
                                          .saveFavorite(product.id!);
                                    }
                                  },
                                  product: product,
                                ));
                          }),
                    ],
                  ));
  }
}
