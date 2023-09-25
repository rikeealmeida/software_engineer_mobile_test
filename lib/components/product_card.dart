import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/pages/product_detail_page.dart';
import 'package:desafio_software_engineer_mobileflutter/states/favorites_store.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final FavoriteStore favoriteStore = FavoriteStore();
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              productModel: widget.product,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              height: 121,
              width: 126,
              child: Image.network(widget.product.image!),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.title!,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff37474f),
                    ),
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
                      InkWell(
                        onTap: () async {
                          if (favoriteStore.value
                              .contains(widget.product.id.toString())) {
                            await favoriteStore
                                .removeFavorite(widget.product.id!);
                          } else {
                            await favoriteStore
                                .saveFavorite(widget.product.id!);
                          }
                        },
                        child: favoriteStore.value
                                .contains(widget.product.id.toString())
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                        color: Color(0xfff37a20),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 1.5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
