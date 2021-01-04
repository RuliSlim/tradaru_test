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
      temp.add(parsedJson["image"]);
    }

    _rate = _randomRate(0, 5);
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
    return (max - min) + rn.nextDouble();
  }
}
