import 'package:Tradaru/src/models/product_model.dart';
import 'package:Tradaru/src/provider/favorite_preferences.dart';
import 'package:rxdart/subjects.dart';

class FavoriteProductBloc {
  final BehaviorSubject<bool> _isFavorite = BehaviorSubject();
  final FavoritePreferences _pref = FavoritePreferences();
  List<ProductModel> _favProducts;

  // List<ProductModel> _getFav() {
  //   final data = _pref.getFav();
  //   List<ProductModel> result = [];
  //   data.then((value) => result = value);
  //   return result;
  // }

  checkFav(ProductModel product) async {
    _favProducts = await _pref.getFav();

    int index = 0;
    bool found = false;

    if (_favProducts != null) {
      if (_favProducts.length > 0) {
        for (var i in _favProducts) {
          if (i.title == product.title) {
            found = true;
            break;
          }
          index++;
        }
      }
    }

    index = found ? index : -1;

    if (index == -1) {
      _isFavorite.sink.add(false);
    } else {
      _isFavorite.sink.add(true);
    }
  }

  addToFav(ProductModel product) {
    _favProducts.add(product);
    String encoded = ProductModel.encode(_favProducts);
    _pref.saveFav(encoded);
    _isFavorite.sink.add(true);
  }

  removeFav(ProductModel product) {
    int index = 0;
    bool found = false;

    if (_favProducts != null) {
      if (_favProducts.length > 0) {
        for (var i in _favProducts) {
          if (i.title == product.title) {
            found = true;
            break;
          }
          index++;
        }
      }
    }

    index = found ? index : -1;

    _favProducts.removeAt(index);

    String encoded = ProductModel.encode(_favProducts);
    _pref.saveFav(encoded);
    _isFavorite.sink.add(false);
  }

  Stream<bool> get isFavorite => _isFavorite.stream;

  dispose() {
    _isFavorite.close();
  }
}
