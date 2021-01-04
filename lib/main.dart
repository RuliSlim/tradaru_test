import 'package:Tradaru/src/components/appbar/my_appbar.dart';
import 'package:Tradaru/src/pages/product/product_detail.dart';
import 'package:Tradaru/src/pages/product/product_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (BuildContext context) => MyApp(),
      "/detail": (BuildContext context) => ProductDetail()
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  List<Widget> _items = [ProductList()];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: MyAppBar(MyAppBarType.list),
          backgroundColor: Colors.grey[100],
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.apps,
              color: Colors.black,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        body: _items[_index],
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 30,
            child: _buildItemNavbar(width: width)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildCenterButton());
  }

  Widget _buildItemNavbar({double width}) {
    return (Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 0.3 * width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.mail,
                      color: _index == 0 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _index == 1 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          SizedBox(
            width: 0.25 * width,
          ),
          Container(
            width: 0.3 * width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.note_add,
                      color: _index == 2 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.person,
                      color: _index == 3 ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildCenterButton() {
    return (Container(
      child: Stack(
        children: [
          FloatingActionButton(
            elevation: 200,
            highlightElevation: 20,
            isExtended: true,
            child: Icon(Icons.shopping_cart),
            onPressed: () {},
            // shape: ,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "4",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    ));
  }
}
