import 'package:lubby/app/src/modules/cart/cart_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/cart/stores/cart_store.dart';
import 'package:lubby/app/src/routes/routes.dart';
import 'package:lubby/app/src/shared/services/rest_product_service.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore(RestProductService())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(cart, child: (_, args) => CartPage()),
  ];
}
