import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  @observable
  String name;

  @action
  changeName(String value) => name = value;

  @observable
  double price;

  @action
  changePrice(double value) => price = value;
}
