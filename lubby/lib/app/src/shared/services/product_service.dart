import 'package:lubby/app/src/shared/models/product.dart';
import 'package:mobx/mobx.dart';

abstract class ProductService {
  Future<List<Product>> findAll();
  void add(Product product);
  List<Product> getProducts();
}
