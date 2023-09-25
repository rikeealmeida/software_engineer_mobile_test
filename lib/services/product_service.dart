import 'package:desafio_software_engineer_mobileflutter/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  final http = Dio();
  final baseUrl = 'https://fakestoreapi.com';

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get('$baseUrl/products');
    if (response.statusCode == 200) {
      List results = response.data;
      return results.map((r) => ProductModel.fromJson(r)).toList();
    } else {
      throw Exception(response.data);
    }
  }
}
