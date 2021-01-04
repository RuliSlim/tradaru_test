import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String title;
  MyTextType type;
  double _width;
  Color _color;
  FontWeight _fontWeight;

  MyText({this.title, this.type});

  @override
  Widget build(BuildContext context) {
    _setWidth(context);
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: _width,
        color: _color,
        fontWeight: _fontWeight,
      ),
    );
  }

  double _setWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    switch (type) {
      case MyTextType.title:
        _width = 0.07 * width;
        _color = Colors.blue[900];
        _fontWeight = FontWeight.w900;
        break;
      case MyTextType.listTitle:
        _width = 0.04 * width;
        _color = Colors.blue[900];
        _fontWeight = FontWeight.w900;
        break;
      case MyTextType.caption:
        _width = 0.04 * width;
        _color = Colors.blue[900];
        _fontWeight = FontWeight.w600;
        break;
      case MyTextType.normal:
        _width = 0.04 * width;
        _color = Colors.black;
        _fontWeight = FontWeight.normal;
        break;
      case MyTextType.price:
        _width = 0.05 * width;
        _color = Colors.blue[900];
        _fontWeight = FontWeight.w900;
        break;
      case MyTextType.smallCaption:
        _width = 0.02 * width;
        _color = Colors.black54;
        _fontWeight = FontWeight.normal;
    }
  }
}

enum MyTextType { title, normal, caption, price, listTitle, smallCaption }
