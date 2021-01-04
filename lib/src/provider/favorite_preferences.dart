import 'package:Tradaru/src/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePreferences {
  Future<void> saveFav(String products) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("favorite", products);
  }

  Future<List<ProductModel>> getFav() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final String saved = pref.getString("favorite");
    if (saved.isEmpty) return [];
    return ProductModel.decode(pref.getString("favorite"));
  }
}
