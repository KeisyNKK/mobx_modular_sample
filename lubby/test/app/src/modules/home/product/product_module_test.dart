import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lubby/app/src/modules/product/product_module.dart';

void main() {
  setUpAll(() {
    initModule(ProductModule());
  });
}
