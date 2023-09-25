import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/states/favorites_store.dart';
import 'package:desafio_software_engineer_mobileflutter/utils/capitalize.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 310,
                  width: 322,
                  child: Image.network('${widget.product.image}'),
                ),
              ),
              Text(
                widget.product.title!,
                style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffffd700),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${widget.product.rating!.rate} (${widget.product.rating!.count} reviews)',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.215,
                          color: const Color(0xff37474f).withOpacity(.65),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 94, 196, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        height: 1.5),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.sort),
                  const SizedBox(width: 10),
                  Flexible(child: Text('${widget.product.category}'.capitalize())),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.format_align_justify),
                  const SizedBox(width: 10),
                  Flexible(child: Text('${widget.product.description}')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
