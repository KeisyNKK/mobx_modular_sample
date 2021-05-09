import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/product/products_page.dart';
import 'package:lubby/app/src/routes/routes.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(products, child: (_, args) => ProductsPage()),
  ];
}
