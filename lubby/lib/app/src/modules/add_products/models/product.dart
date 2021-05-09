import 'dart:ffi';

import 'package:mobx/mobx.dart';

class Product {
  @observable
  String name;

  @action
  setName(String value) => name = value;

  @observable
  double price;

  @action
  setPrice(double value) => price = value;
}
