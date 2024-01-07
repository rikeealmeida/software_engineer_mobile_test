import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:desafio_software_engineer_mobileflutter/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final bool isFromFavoritePage;
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onTap;
  final Function(dynamic) navigatorCallback;
  const ProductCard(
      {super.key,
      required this.isFromFavoritePage,
      required this.navigatorCallback,
      required this.isFavorite,
      required this.onTap,
      required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  product: widget.product,
                ),
              ),
            )
            .then(widget.navigatorCallback);
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
                        widget.isFromFavoritePage
                            ? const SizedBox()
                            : InkWell(
                                onTap: widget.onTap,
                                child: widget.isFavorite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                      ),
                              )
                      ]),
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
