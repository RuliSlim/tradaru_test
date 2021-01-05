import 'package:Tradaru/src/components/favorite_indicator/my_favorite_button.dart';
import 'package:Tradaru/src/components/text/my_text.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final ProductModel product;

  MyCard({this.product});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isFavorie = false;
  @override
  Widget build(BuildContext context) {
    final double width = 40 / 100 * MediaQuery.of(context).size.width;
    final double height = 275;
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 15),
          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                headerCard(width),
                Image.network(
                  widget.product.image[0],
                  width: 0.5 * width,
                ),
                MyText(title: widget.product.title, type: MyTextType.caption),
                MyText(
                    title: "\$ ${widget.product.price}",
                    type: MyTextType.price),
                ratingCard(width: width)
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed("/detail", arguments: widget.product);
      },
    );
  }

  Widget headerCard(double width) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.product.discount > 0) buildDiscount(),
        Container(
          width: width - 100,
          child: Align(
            alignment: Alignment.centerRight,
            child: MyFavorite(
              product: widget.product,
            ),
          ),
        )
      ],
    ));
  }

  Widget buildDiscount() {
    return Container(
      width: 50,
      height: 40,
      child: Card(
        color: Colors.lightBlueAccent[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(child: Text("${widget.product.discount}%")),
        ),
      ),
    );
  }

  Widget buildFav({bool isFav, double}) {
    return !isFav
        ? IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                isFavorie = true;
              });
            })
        : Container(
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    isFavorie = false;
                  });
                }),
          );
  }

  Widget ratingCard({double width}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildStars(width));
  }

  List<Widget> _buildStars(double width) {
    List<Widget> result = [];
    for (int i = 0; i < 6; i++) {
      if (i < widget.product.rate.toInt()) {
        result.add(
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star,
              color: Colors.yellow[600],
              size: 0.1 * width,
            ),
          ),
        );
      } else if (i.toDouble() - widget.product.rate > 0 &&
          i.toDouble() - widget.product.rate < 1) {
        result.add(
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star_half,
              color: Colors.yellow[600],
              size: 0.1 * width,
            ),
          ),
        );
      } else if (i.toDouble() - widget.product.rate > 1) {
        result.add(
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              Icons.star_border,
              size: 0.1 * width,
            ),
          ),
        );
      }
    }

    result.add(MyText(
      title: "(${widget.product.rate.toStringAsFixed(1)})",
      type: MyTextType.smallCaption,
    ));

    return result;
  }
}
