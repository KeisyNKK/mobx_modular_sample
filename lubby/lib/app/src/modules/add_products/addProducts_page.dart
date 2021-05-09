import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/add_products/stores/addProducts_store.dart';

class AddProductsPage extends StatefulWidget {
  final String title;
  const AddProductsPage({Key key, this.title = 'AddProductsPage'})
      : super(key: key);
  @override
  AddProductsPageState createState() => AddProductsPageState();
}

class AddProductsPageState extends State<AddProductsPage> {
  final AddProductsStore store = Modular.get();

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
