import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/add_products/models/product_store.dart';
import 'package:lubby/app/src/modules/product/stores/products_store.dart';
import 'package:lubby/app/src/shared/models/product.dart';
import 'package:mobx/mobx.dart';

part 'add_products_store.g.dart';

class AddProductsStore = _AddProductsStoreBase with _$AddProductsStore;

abstract class _AddProductsStoreBase with Store {
  var product = ProductStore();

  var _homeStore = Modular.get<ProductsStore>();

  void add() {
    _homeStore.add(Product("123 ${product.name}", product.name, product.price));
  }
}
