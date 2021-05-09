import 'package:lubby/app/src/modules/home/product/product_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/product/stores/product_store.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductPage()),
  ];
}
