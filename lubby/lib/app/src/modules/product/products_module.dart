import 'package:lubby/app/src/modules/add_products/addProducts_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddProductsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AddProductsPage()),
  ];
}
