import 'package:lubby/app/src/shared/models/product.dart';

abstract class ProductService {
  Future<List<Product>> findAll();
}
