import 'package:Tradaru/src/components/card/card.dart';
import 'package:Tradaru/src/components/category_chip/category_chip.dart';
import 'package:Tradaru/src/components/header/header.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Header(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryChip(),
                    CategoryChip(),
                    CategoryChip(),
                  ],
                ),
                SizedBox(
                  width: width,
                  height: 15,
                ),
                Container(
                  width: width,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
