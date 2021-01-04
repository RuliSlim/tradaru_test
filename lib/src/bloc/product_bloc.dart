import 'package:Tradaru/src/models/product_model.dart';
import 'package:Tradaru/src/resources/repository.dart';
import 'package:rxdart/subjects.dart';

class ProductBloc {
  final Repository _repository = Repository();
  final PublishSubject<List<ProductModel>> _products = PublishSubject();

  fetchProducts() async {
    List<ProductModel> _result = await _repository.fetchProducts();
    _products.sink.add(_result);
  }

  Stream<List<ProductModel>> get products => _products.stream;

  dispose() {
    _products.close();
  }
}
