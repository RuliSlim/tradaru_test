import 'package:Tradaru/src/Api/products_api.dart';
import 'package:Tradaru/src/models/product_model.dart';

class Repository {
  ProductApi _productApi = ProductApi();

  Future<List<ProductModel>> fetchProducts() => _productApi.fetchProducts();
}
