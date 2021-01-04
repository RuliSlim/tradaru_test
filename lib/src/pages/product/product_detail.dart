import 'package:Tradaru/src/components/category_chip/category_chip.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    ProductModel _product = ModalRoute.of(context).settings.arguments;
    product = _product;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Flexible(
            child: _buildImage(width: width),
            flex: 3,
          ),
          Flexible(
            child: _buildDescription(width: width),
            flex: 2,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.grey[200],
        child: _buildBottom(height: height, width: width),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text("Product detail"),
          Container(
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  Widget _buildImage({double width}) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryChip(),
          Image.network(
            product.image[0],
            width: 0.4 * width,
          ),
          Container(
            width: 0.1 * width,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue),
          )
        ],
      );

  Widget _buildDescription({double width}) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: _buildHeaderDesc(width: width),
                flex: 1,
              ),
              Flexible(
                child: _buildOptions(width: width),
                flex: 1,
              )
            ],
          ),
        ),
      );

  Widget _buildHeaderDesc({double width}) => SingleChildScrollView(
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      product.title,
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 0.07 * width,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      Text(
                        "(4.3)",
                      )
                    ],
                  )
                ],
              ),
              Text(
                product.description,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 0.04 * width,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      );

  Widget _buildOptions({double width}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Size: ",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 0.04 * width,
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                        onPressed: () {},
                        color: Colors.lightBlue[300],
                        height: 50,
                        minWidth: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "US 6",
                          style: TextStyle(fontSize: 0.04 * width),
                        )),
                    FlatButton(
                        onPressed: () {},
                        color: Colors.lightBlue[300],
                        height: 50,
                        minWidth: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "US 7",
                          style: TextStyle(fontSize: 0.04 * width),
                        )),
                    FlatButton(
                        onPressed: () {},
                        color: Colors.lightBlue[300],
                        height: 50,
                        minWidth: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "US 8",
                          style: TextStyle(fontSize: 0.04 * width),
                        )),
                    FlatButton(
                        onPressed: () {},
                        color: Colors.lightBlue[300],
                        height: 50,
                        minWidth: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "US 9",
                          style: TextStyle(fontSize: 0.04 * width),
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Available Color: ",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 0.04 * width,
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 0.075 * width,
                      height: 0.075 * width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow),
                    ),
                    Container(
                      width: 0.075 * width,
                      height: 0.075 * width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                    Container(
                      width: 0.075 * width,
                      height: 0.075 * width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink),
                    ),
                    Container(
                      width: 0.075 * width,
                      height: 0.075 * width,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      );

  Widget _buildBottom({double height, double width}) => Container(
        height: 0.1 * height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 269.00",
                style: TextStyle(
                    fontSize: 0.08 * width, fontWeight: FontWeight.w900),
              ),
              FlatButton(
                onPressed: () {},
                color: Colors.grey[300],
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                    Text(
                      "Add to chart",
                      style:
                          TextStyle(color: Colors.blue, fontSize: 0.04 * width),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
