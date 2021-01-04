import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
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
                  "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                  width: 0.5 * width,
                ),
                Text(
                  "Foldsack No. 1 Backpack",
                  style: TextStyle(fontSize: 0.08 * width),
                ),
                Text(
                  "\$ 109.95,",
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
    );
  }

  Widget headerCard() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Disokon"), buildFav(isFav: isFavorie)],
    ));
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
