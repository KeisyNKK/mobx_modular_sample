import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/product/product_store.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key key, this.title = 'ProductPage'}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final ProductStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
