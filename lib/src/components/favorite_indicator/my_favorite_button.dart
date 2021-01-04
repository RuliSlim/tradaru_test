import 'package:Tradaru/src/bloc/favorite_product_bloc.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class MyFavorite extends StatefulWidget {
  final ProductModel productModel;

  MyFavorite({this.productModel});
  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  FavoriteProductBloc _bloc = FavoriteProductBloc();

  @override
  void initState() {
    super.initState();
    _bloc.checkFav();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _bloc.isFavorite,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.data == true) {
          return _fav();
        }

        return _notFav(snapshot);
      },
    );
  }

  Widget _notFav(AsyncSnapshot<bool> snapshot) => IconButton(
      icon: Icon(Icons.favorite_border),
      onPressed: () {
        _bloc.addToFav();
      });

  Widget _fav() => Container(
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.white,
            onPressed: () {
              _bloc.removeFav();
            }),
      );
}
