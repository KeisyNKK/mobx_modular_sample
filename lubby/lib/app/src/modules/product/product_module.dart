import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/product/stores/product_store.dart';
import 'package:lubby/app/src/routes/routes.dart';
import 'product_page.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(products, child: (_, args) => ProductsPage()),
  ];
}
