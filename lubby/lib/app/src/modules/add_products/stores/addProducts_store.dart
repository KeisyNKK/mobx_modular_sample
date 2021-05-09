import 'package:lubby/app/src/modules/add_products/models/product.dart';
import 'package:mobx/mobx.dart';

part 'addProducts_store.g.dart';

class AddProductsStore = _AddProductsStoreBase with _$AddProductsStore;

abstract class _AddProductsStoreBase with Store {
  var product = new Product();

  validatePrice() {
    if (product.price <= 0) {
      return "Digite um valor";
    }
  }
}
