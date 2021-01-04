import 'package:rxdart/subjects.dart';

class FavoriteProductBloc {
  final BehaviorSubject<bool> _isFavorite = BehaviorSubject();

  checkFav() {
    _isFavorite.sink.add(false);
  }

  addToFav() {
    _isFavorite.sink.add(true);
  }

  removeFav() {
    print("<?IMASFUSAFNL>");
    _isFavorite.sink.add(false);
  }

  Stream<bool> get isFavorite => _isFavorite.stream;

  dispose() {
    _isFavorite.close();
  }
}
