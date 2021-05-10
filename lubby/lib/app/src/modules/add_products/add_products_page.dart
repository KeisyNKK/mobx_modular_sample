import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/add_products/stores/add_products_store.dart';
import 'package:lubby/app/src/routes/routes.dart';

class AddProductsPage extends StatefulWidget {
  final String title;
  const AddProductsPage({Key key, this.title = 'AddProductsPage'})
      : super(key: key);
  @override
  _AddProductsPageState createState() => _AddProductsPageState();
}

class _AddProductsPageState
    extends ModularState<AddProductsPage, AddProductsStore> {
  _textField(
      {String labelText,
      onChanged,
      String Function() errorText,
      keyboardType}) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.name,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Produto"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(controller.product.name ?? "novo"),
                        ),
                        Container(
                          child: Text(controller.product.price == null
                              ? "00"
                              : controller.product.price.toString()),
                        )
                      ],
                    );
                  },
                ),
              ),
              Observer(builder: (_) {
                return _textField(
                  labelText: "Nome",
                  onChanged: controller.product.changeName,
                );
              }),
              Observer(builder: (_) {
                return _textField(
                  keyboardType: TextInputType.number,
                  labelText: "Preço",
                  onChanged: (value) {
                    controller.product.changePrice(double.parse(value));
                  },
                );
              }),
              Observer(builder: (_) {
                return ElevatedButton(
                    onPressed: () => controller.add(),
                    child: Text("Adicionar produto"));
              }),
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Modular.to.pushNamed(cart);
          }),
    );
  }
}
