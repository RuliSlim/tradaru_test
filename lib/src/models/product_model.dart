import 'dart:math';

class ProductModel {
  int _id;
  String _title;
  double _price;
  String _description;
  String _category;
  List<String> _image;
  double _rate;
  int _discount;

  ProductModel(
      {int id,
      String title,
      double price,
      String description,
      String category,
      List<String> image,
      double rate,
      int discount}) {
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _image = image;
    _rate = rate;
    _discount = discount;
  }

  ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson["id"];
    _title = parsedJson["title"];
    _price = parsedJson["price"].toDouble();
    _description = parsedJson["description"];
    _category = parsedJson["category"];

    // data dummy;
    List<String> temp = [];
    int images = _random(1, 5);
    for (int i = 0; i < images; i++) {
      if (i == 0) {
        temp.add(parsedJson["image"]);
      } else {
        temp.add("https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg");
      }
    }

    _rate = _randomRate(1, 4);
    _discount = _random(0, 70);

    _image = temp;
  }

  int get id => _id;
  String get title => _title;
  double get price => _price;
  String get description => _description;
  String get category => _category;
  List<String> get image => _image;
  int get discount => _discount;
  double get rate => _rate;

  // dummy images
  int _random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  double _randomRate(min, max) {
    var rn = new Random();
    return max * rn.nextDouble() + min;
  }
}
