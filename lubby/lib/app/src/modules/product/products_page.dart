import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/cart/stores/cart_store.dart';
import 'package:lubby/app/src/routes/routes.dart';
import 'package:lubby/app/src/shared/models/cart_item.dart';

import 'stores/products_store.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key key, this.title = 'ProductsPage'}) : super(key: key);
  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  final ProductsStore store = Modular.get();

  ProductsStore _homeStore;
  ShoppingCart _counterStore;

  @override
  void initState() {
    _homeStore = Modular.get<ProductsStore>();
    _homeStore.reload();
    _counterStore = Modular.get<ShoppingCart>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("${_counterStore.itemsCount}");
        }),
      ),
      body: Observer(builder: (_) {
        final items = _homeStore.products.value;
        if (_homeStore.hasError())
          return const Center(
            child: Text("Ocorreu um erro"),
          );
        else if (_homeStore.loading())
          return const Center(
            child: CircularProgressIndicator(),
          );
        else
          return RefreshIndicator(
            onRefresh: () async {
              _homeStore.reload();
            },
            child: Container(
              padding: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: (70.0 * items.length),
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (_, int index) {
                          final product = items[index];
                          return Observer(builder: (_) {
                            return ListTile(
                              leading: _counterStore.contains(product)
                                  ? const Icon(Icons.remove_shopping_cart,
                                      color: Colors.red)
                                  : const Icon(Icons.add_shopping_cart,
                                      color: Colors.red),
                              onTap: () {
                                if (_counterStore.contains(product)) {
                                  _counterStore.remove(CartItem(product));
                                } else {
                                  _counterStore.add(product);
                                }
                              },
                              title: Text("1${product.name}"),
                              subtitle: Text(
                                "${product.price.toStringAsFixed(2)}",
                              ),
                            );
                          });
                        }),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle, color: Colors.red),
                    onTap: () {
                      _homeStore.add();
                      Modular.to.pushNamed(add);
                    },
                    title: Text("Crie um produto"),
                    subtitle: Text(
                      " ",
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle, color: Colors.red),
                    onTap: () {
                      Modular.to.pushNamed(add);
                    },
                    title: Text("Crie um produto"),
                    subtitle: Text(
                      " ",
                    ),
                  )
                ],
              ),
            ),
          );
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Modular.to.pushNamed(cart);
          }),
    );
  }
}
