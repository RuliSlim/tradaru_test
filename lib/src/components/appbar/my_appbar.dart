import 'package:Tradaru/src/components/favorite_indicator/my_favorite_button.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBarType type;
  ProductModel product;

  MyAppBar(this.type, {this.product});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            children: [
              Text(
                "X",
                style:
                    TextStyle(fontSize: 0.08 * width, color: Colors.blue[900]),
              ),
              Text(
                "E",
                style: TextStyle(
                    fontSize: 0.08 * width, color: Colors.lightBlue[200]),
              )
            ],
          ),
          _suffix()
        ],
      ),
    );
  }

  Widget _suffix() {
    if (type == MyAppBarType.detail) {
      return MyFavorite(product: product);
    } else {
      return IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {});
    }
  }
}

enum MyAppBarType { list, detail }
