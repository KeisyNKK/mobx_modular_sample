import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/add_products/stores/add_products_store.dart';
import 'package:lubby/app/src/routes/routes.dart';

import 'add_products_page.dart';

class AddProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(add, child: (_, args) => AddProductsPage()),
  ];
}
