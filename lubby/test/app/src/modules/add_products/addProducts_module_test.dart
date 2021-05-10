import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lubby/app/src/modules/add_products/add_products_module.dart';

void main() {
  setUpAll(() {
    initModule(AddProductsModule());
  });
}
