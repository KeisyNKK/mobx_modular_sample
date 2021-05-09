import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/home/home_module.dart';
import 'package:lubby/app/src/modules/home/stores/home_store.dart';
import 'package:lubby/app/src/modules/product/product_module.dart';
import 'package:lubby/app/src/modules/product/stores/product_store.dart';
import 'package:lubby/app/src/routes/routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => ProductStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(home, module: HomeModule()),
    ModuleRoute(products, module: ProductModule()),
  ];
}
