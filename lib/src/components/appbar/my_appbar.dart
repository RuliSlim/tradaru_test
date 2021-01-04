import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBarType type;

  MyAppBar(this.type);

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
      return Container(
        decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(Icons.favorite), color: Colors.white, onPressed: () {}),
      );
    } else {
      return IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {});
    }

    return Container();
  }
}

enum MyAppBarType { list, detail }
