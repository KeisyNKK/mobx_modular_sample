import 'package:lubby/app/src/modules/add_products/addProducts_Page.dart';
import 'package:lubby/app/src/modules/add_products/stores/addProducts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AddProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AddProductsPage()),
  ];
}
