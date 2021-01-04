import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Our Products"),
          DropdownButton(
            items: null,
            onChanged: null,
            hint: Text("Sort by"),
          )
        ],
      ),
    );
  }
}
