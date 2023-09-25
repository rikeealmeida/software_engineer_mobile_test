import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/services/local_db.dart';
import 'package:desafio_software_engineer_mobileflutter/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<List<ProductModel>> {
  final ProductService productService = ProductService();
  bool isLoading = false;
  List<ProductModel> products = [];

  ProductStore(super.value);

  Future<void> getProducts() async {
    isLoading = true;
    products = await productService.getProducts();
    value = products;
    isLoading = false;
  }

  Future<void> getFavoriteProducts() async {
    final LocalDBService dbService = LocalDBService();
    isLoading = true;
    var newProducts = await productService.getProducts();
    var favoriteProducts = <ProductModel>[];
    var favorites = await dbService.getFavorites();
    for (String favorite in favorites) {
      var product = newProducts
          .firstWhere((product) => product.id.toString() == favorite);
      favoriteProducts.add(product);
    }
    value = favoriteProducts.reversed.toList();
    isLoading = false;
  }

  void filterProducts(String productName) {
    if (productName.isNotEmpty) {
      value = products
          .where(
            (product) => product.title!.toLowerCase().contains(
                  productName.toLowerCase(),
                ),
          )
          .toList();
    } else {
      value = products;
    }
  }
}
