import 'package:lubby/app/src/shared/models/cart_item.dart';
import 'package:lubby/app/src/shared/models/product.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class ShoppingCart = _ShoppingCartBase with _$ShoppingCart;

abstract class _ShoppingCartBase with Store {
  @observable
  ObservableList<CartItem> obs = <CartItem>[].asObservable();

  int itemsCount() {
    return obs.length;
  }

  double total() {
    return 3;
  }

  @action
  void add(Product item) {
    obs.add(CartItem(item));
  }

  @action
  void remove(CartItem item) {
    obs.remove(item);
  }

  bool contains(Product product) {
    if (obs.contains(CartItem(product))) {
      return true;
    }
    return false;
  }
}
