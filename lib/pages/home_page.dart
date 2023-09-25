import 'package:desafio_software_engineer_mobileflutter/components/custom_app_bar.dart';
import 'package:desafio_software_engineer_mobileflutter/components/custom_search_field.dart';
import 'package:desafio_software_engineer_mobileflutter/components/product_card.dart';
import 'package:desafio_software_engineer_mobileflutter/pages/favorites_page.dart';
import 'package:desafio_software_engineer_mobileflutter/states/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final productStore = ProductStore();

  @override
  void initState() {
    super.initState();
    productStore.getProducts();
    productStore.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar('Products', [
          IconButton(
            tooltip: 'Favorites',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavoritesPage()));
            },
            icon: const Icon(Icons.favorite_outline),
          ),
        ]),
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
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/svg/empty_list.svg'),
                                const SizedBox(height: 20),
                                Text(
                                  'The list is empty',
                                  style: TextStyle(
                                      color: const Color(0xFF37474F)
                                          .withOpacity(.65),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.1),
                                )
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.only(top: 20),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: productStore.value.length,
                            itemBuilder: (context, index) {
                              var product = productStore.value[index];
                              return ProductCard(
                                
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
