import 'package:desafio_software_engineer_mobileflutter/components/custom_app_bar.dart';
import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailPage({super.key, required this.productModel});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Product Details', [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
      ]),
    );
  }
}
