import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  ProductModel product;

  MyCard({this.product});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool isFavorie = false;
  @override
  Widget build(BuildContext context) {
    final double width = 40 / 100 * MediaQuery.of(context).size.width;
    final double height = 1.5 * width;
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                headerCard(),
                Image.network(
                  widget.product.image[0],
                  width: 0.5 * width,
                ),
                Text(
                  widget.product.title,
                  style: TextStyle(
                    fontSize: 0.08 * width,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "\$ ${widget.product.price}",
                  style: TextStyle(
                      fontSize: 0.1 * width,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w900),
                ),
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

  Widget headerCard() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.product.discount > 0) buildDiscount(),
        buildFav(isFav: isFavorie)
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

  Widget buildFav({bool isFav}) {
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
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            color: Colors.yellow[600],
            size: 0.1 * width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            color: Colors.yellow[600],
            size: 0.1 * width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            color: Colors.yellow[600],
            size: 0.1 * width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star,
            color: Colors.yellow[600],
            size: 0.1 * width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(
            Icons.star_border,
            size: 0.1 * width,
          ),
        ),
        Text("(4)")
      ],
    );
  }
}
