import 'package:lubby/app/src/modules/cart/cart_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/routes/routes.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(cart, child: (_, args) => CartPage()),
  ];
}
