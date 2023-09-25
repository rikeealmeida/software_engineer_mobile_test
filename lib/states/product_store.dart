import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<List<ProductModel>> {
  ProductStore() : super([]);

  final ProductService productService = ProductService();
  bool isLoading = false;
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    isLoading = true;
    products = await productService.getProducts();
    value = products;
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
