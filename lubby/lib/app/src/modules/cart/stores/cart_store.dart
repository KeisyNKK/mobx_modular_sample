import 'package:lubby/app/src/shared/models/product.dart';
import 'package:lubby/app/src/shared/services/product_service.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final ProductService _productService;

  @observable
  ObservableFuture<List<Product>> products = ObservableFuture.value(null);

  bool loading() {
    return products.status == FutureStatus.pending;
  }

  bool hasError() {
    return products.error != null;
  }

  _CartStoreBase(this._productService);

  @action
  void reload() {
    products = _productService.findAll().asObservable();
  }
}
