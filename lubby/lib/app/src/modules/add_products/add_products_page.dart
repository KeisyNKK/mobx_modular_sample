import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/add_products/stores/add_products_store.dart';
import 'package:lubby/app/src/modules/cart/stores/cart_store.dart';
import 'package:lubby/app/src/routes/routes.dart';
import 'package:lubby/app/src/shared/models/cart_item.dart';
import 'package:lubby/app/src/shared/services/rest_product_service.dart';

class AddProductsPage extends StatefulWidget {
  final String title;
  const AddProductsPage({Key key, this.title = 'AddProductsPage'})
      : super(key: key);
  @override
  AddProductsPageState createState() => AddProductsPageState();
}

class AddProductsPageState extends State<AddProductsPage> {
  final AddProductsStore store = Modular.get();

  AddProductsStore _homeStore;
  ShoppingCart _counterStore;

  @override
  void initState() {
    _homeStore = Modular.get<AddProductsStore>();
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
                      title: Text("${product.name}"),
                      subtitle: Text(
                        "${product.price.toStringAsFixed(2)}",
                      ),
                    );
                  });
                }),
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
