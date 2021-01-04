import 'package:Tradaru/src/models/product_model.dart';

class FavProvider {
  List<ProductModel> _favorites = [];

  List<ProductModel> get getMyFavorites => _favorites;

  void addFavorite(ProductModel product) {
    _favorites.add(product);
  }

  void removeFavorite(ProductModel product) {
    _favorites.remove(product);
  }
}
