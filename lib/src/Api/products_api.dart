import 'dart:convert';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:http/http.dart' show Client;

class ProductApi {
  Client _client = Client();
  final String _url = "https://fakestoreapi.com/products?limit=10";

  Future<List<ProductModel>> fetchProducts() async {
    final _response = await _client.get(_url);

    if (_response.statusCode != 200) {
      throw Exception("Failed to fetch products...");
    }

    final parsedJson = jsonDecode(_response.body) as List;

    List<ProductModel> result = [];
    parsedJson.forEach((element) {
      result.add(ProductModel.fromJson(element));
    });

    return result;
  }
}
