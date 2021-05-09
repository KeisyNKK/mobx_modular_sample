import 'package:lubby/app/src/shared/models/product.dart';
import 'package:lubby/app/src/shared/services/product_service.dart';
import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;

abstract class _ProductsStoreBase with Store {
  final ProductService _productService;

  @observable
  ObservableFuture<List<Product>> products = ObservableFuture.value(null);

  bool loading() {
    return products.status == FutureStatus.pending;
  }

  bool hasError() {
    return products.error != null;
  }

  @action
  add() {
    _productService.add(Product("Novo prod", "Novin", 10));
    reload();
  }

  _ProductsStoreBase(this._productService);

  @action
  void reload() {
    products = _productService.findAll().asObservable();
  }
}
