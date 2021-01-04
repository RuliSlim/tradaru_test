import 'package:Tradaru/src/models/product_model.dart';
import 'package:Tradaru/src/provider/favorite_preferences.dart';
import 'package:rxdart/subjects.dart';

class FavoriteProductBloc {
  final BehaviorSubject<bool> _isFavorite = BehaviorSubject();
  final List<ProductModel> _favProducts = [];
  final FavoritePreferences _pref = FavoritePreferences();

  checkFav(ProductModel product) async {
    // List<ProductModel> _favProducts = await _pref.getFav();

    int index = _favProducts.indexOf(product);

    if (index == -1) {
      _isFavorite.sink.add(false);
    } else {
      _isFavorite.sink.add(true);
    }
  }

  addToFav(ProductModel product) {
    // _favProducts.add(product);
    // String encoded = ProductModel.encode(_favProducts);
    // _pref.saveFav(encoded);
    _isFavorite.sink.add(true);
  }

  removeFav(ProductModel product) {
    // _favProducts.remove(product);
    // String encoded = ProductModel.encode(_favProducts);
    // _pref.saveFav(encoded);
    _isFavorite.sink.add(false);
  }

  Stream<bool> get isFavorite => _isFavorite.stream;

  dispose() {
    _isFavorite.close();
  }
}
