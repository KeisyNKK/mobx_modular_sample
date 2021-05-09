import 'package:flutter_modular/flutter_modular.dart';
import 'package:lubby/app/src/modules/home/home_module.dart';
import 'package:lubby/app/src/modules/home/repositories/post_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PostRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
