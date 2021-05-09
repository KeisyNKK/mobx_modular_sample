import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:lubby/app/src/modules/cart/stores/cart_store.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  ShoppingCart shoppingCart;

  _CartPageState() {
    shoppingCart = Modular.get<ShoppingCart>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("${shoppingCart.total().toStringAsFixed(2)}");
        }),
      ),
      body: Observer(builder: (_) {
        final items = shoppingCart.obs;
        return ListView.separated(
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: items.length,
            itemBuilder: (_, int index) {
              final item = items[index];
              return Observer(builder: (_) {
                return Dismissible(
                    onDismissed: (direction) {
                      shoppingCart.remove(item);
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
