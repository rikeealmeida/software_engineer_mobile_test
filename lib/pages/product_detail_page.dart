import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/states/favorites_store.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final FavoriteStore favoriteStore = FavoriteStore([]);
  @override
  void initState() {
    super.initState();
    favoriteStore.getFavorites();
    favoriteStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () async {
              if (favoriteStore.value.contains(widget.product.id.toString())) {
                await favoriteStore.removeFavorite(widget.product.id!);
              } else {
                await favoriteStore.saveFavorite(widget.product.id!);
              }
            },
            icon: favoriteStore.value.contains(widget.product.id.toString())
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
