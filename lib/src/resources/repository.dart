import 'package:Tradaru/src/models/product_model.dart';
import 'package:Tradaru/src/provider/products_api.dart';

class Repository {
  ProductApi _productApi = ProductApi();

  Future<List<ProductModel>> fetchProducts() => _productApi.fetchProducts();
}
