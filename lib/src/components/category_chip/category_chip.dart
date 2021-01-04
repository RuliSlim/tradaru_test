import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = 22 / 100 * MediaQuery.of(context).size.width;
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                  width: 0.15 * width,
                ),
                Text("Bags"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
