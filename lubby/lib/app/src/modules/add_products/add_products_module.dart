import 'package:flutter_modular/flutter_modular.dart';

import 'add_products_page.dart';

class AddProductsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AddProductsPage()),
  ];
}
