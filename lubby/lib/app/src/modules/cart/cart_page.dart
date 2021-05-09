import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/cart/stores/cart_store.dart';
import 'package:lubby/app/src/shared/models/cart_item.dart';
import 'package:lubby/app/src/shared/models/cart_store.dart';
import 'package:lubby/app/src/shared/services/rest_product_service.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = 'CartPage'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartStore store = Modular.get();

  CartStore _homeStore;
  ShoppingCart _counterStore;

  @override
  void initState() {
    _homeStore = CartStore(RestProductService());
    _homeStore.reload();
    _counterStore = ShoppingCart();

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
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (_) => CartPages(
                          shoppingCart: _counterStore,
                        )));
          }),
    );
  }
}

class CartPages extends StatefulWidget {
  final ShoppingCart shoppingCart;

  const CartPages({Key key, this.shoppingCart}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("${widget.shoppingCart.total().toStringAsFixed(2)}");
        }),
      ),
      body: Observer(builder: (_) {
        final items = widget.shoppingCart.obs;
        return ListView.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: items.length,
            itemBuilder: (_, int index) {
              final item = items[index];
              return Observer(builder: (_) {
                return Dismissible(
                    onDismissed: (direction) {
                      widget.shoppingCart.remove(item);
                    },
                    key: UniqueKey(),
                    child: Container(
                        height: 120,
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        color: Colors.orange,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              height: 100,
                              width: 100,
                              color: Colors.red,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("nome: ${item.product.name}"),
                                Text(
                                    "preço: ${item.product.price.toStringAsFixed(2)}"),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          item.decrement();
                                        }),
                                    Text("${item.quantity}"),
                                    IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          item.increment();
                                        })
                                  ],
                                ),
                                Text("total:${item.total().toStringAsFixed(2)}")
                              ],
                            ),
                          ],
                        )));
              });
            });
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }
}
