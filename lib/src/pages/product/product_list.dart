import 'package:Tradaru/src/bloc/product_bloc.dart';
import 'package:Tradaru/src/components/card/card.dart';
import 'package:Tradaru/src/components/category_chip/category_chip.dart';
import 'package:Tradaru/src/components/header/header.dart';
import 'package:Tradaru/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ProductBloc _bloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchProducts();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: StreamBuilder(
      stream: _bloc.products,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          return _buildProductList(width: width, products: snapshot);
        }

        return Center(child: CircularProgressIndicator());
      },
    ));
  }

  Widget _buildProductList(
      {double width, AsyncSnapshot<List<ProductModel>> products}) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 10, right: 10, bottom: 100),
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
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (var product in products.data) MyCard(product: product)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
