import 'package:lubby/app/src/shared/models/product.dart';
import 'package:lubby/app/src/shared/services/product_service.dart';
import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore = _AddProductsStoreBase with _$ProductsStore;

abstract class _AddProductsStoreBase with Store {
  final ProductService _productService;

  @observable
  ObservableFuture<List<Product>> products = ObservableFuture.value(null);

  bool loading() {
    return products.status == FutureStatus.pending;
  }

  bool hasError() {
    return products.error != null;
  }

  _AddProductsStoreBase(this._productService);

  @action
  void reload() {
    products = _productService.findAll().asObservable();
  }
}
