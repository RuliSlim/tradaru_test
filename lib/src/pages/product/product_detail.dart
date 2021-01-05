import 'package:Tradaru/src/components/appbar/my_appbar.dart';
import 'package:Tradaru/src/components/text/my_text.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel product;
  int _currentImage = 0;
  int _currentOption = 0;
  List<String> _options = ["US 6", "US 7", "US 8", "US 9"];
  List<Color> _availColors = [
    Colors.yellow,
    Colors.red,
    Colors.pink[100],
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    ProductModel _product = ModalRoute.of(context).settings.arguments;
    product = _product;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: MyAppBar(
            MyAppBarType.detail,
            product: product,
          ),
          backgroundColor: Colors.white10,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).popAndPushNamed("/"))),
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

  Widget _buildImage({double width}) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (product.discount > 1) _buildDiscount(),
          Image.network(
            product.image[_currentImage],
            width: 0.4 * width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var el in product.image)
                _buildScrollIndicator(width: width, idx: el)
            ],
          )
        ],
      );

  Widget _buildScrollIndicator({double width, String idx}) =>
      idx == product.image[_currentImage]
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 0.1 * width,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 0.015 * width,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
              ),
            );

  Widget _buildDiscount() {
    return Container(
      width: 50,
      height: 40,
      child: Card(
        color: Colors.lightBlueAccent[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(child: Text("${product.discount}%")),
        ),
      ),
    );
  }

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
                      "(${product.rate.toStringAsFixed(1)})",
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
                    for (var i in _options)
                      _optionSizing(width: width, type: i),
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
                    for (var color in _availColors)
                      _optionColor(width: width, color: color)
                  ],
                ),
              )
            ],
          )
        ],
      );

  Widget _optionSizing({double width, String type}) {
    return FlatButton(
        onPressed: () {
          print(type);
          int idx = _options.indexOf(type);
          setState(() {
            _currentOption = idx;
          });
        },
        height: 50,
        minWidth: 50,
        color: type == _options[_currentOption]
            ? Colors.lightBlue[200]
            : Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          type,
          style: TextStyle(fontSize: 0.04 * width),
        ));
  }

  Widget _optionColor({double width, Color color}) {
    return Container(
      width: 0.075 * width,
      height: 0.075 * width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment(0, -0.5),
                    child: Text(
                      "\$ ",
                      style: TextStyle(
                          fontSize: 0.04 * width, fontWeight: FontWeight.w900),
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(
                        fontSize: 0.08 * width, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              FlatButton(
                onPressed: () {},
                color: Colors.grey[100],
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.blue[900],
                    ),
                    MyText(
                      title: "Add to cart",
                      type: MyTextType.caption,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
