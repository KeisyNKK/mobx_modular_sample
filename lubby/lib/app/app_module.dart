import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/add_products/add_products_module.dart';
import 'package:lubby/app/src/modules/cart/cart_module.dart';
import 'package:lubby/app/src/modules/home/home_module.dart';
import 'package:lubby/app/src/modules/home/stores/home_store.dart';
import 'package:lubby/app/src/modules/product/products_module.dart';
import 'package:lubby/app/src/modules/product/stores/products_store.dart';
import 'package:lubby/app/src/routes/routes.dart';
import 'package:lubby/app/src/shared/services/rest_product_service.dart';
import 'src/modules/cart/stores/cart_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeStore()),
    Bind.singleton((i) => ShoppingCart()),
    Bind.singleton((i) => ProductsStore(RestProductService())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute(cart, module: CartModule()),
    ModuleRoute(home, module: HomeModule()),
    ModuleRoute(products, module: ProductsModule()),
    ModuleRoute(add, module: AddProductsModule()),
  ];
}
