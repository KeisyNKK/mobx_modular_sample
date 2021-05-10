import 'package:lubby/app/src/shared/models/product.dart';
import 'package:lubby/app/src/shared/services/product_service.dart';

class RestProductService implements ProductService {
  List<Product> products = [Product("+", "Criar um produto", 0)];

  @override
  void add(Product product) {
    products.add(product);
  }

  @override
  Future<List<Product>> findAll() {
    try {
      return Future.delayed(Duration(seconds: 0), () {
        return products;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Product> getProducts() {
    return products;
  }
}
