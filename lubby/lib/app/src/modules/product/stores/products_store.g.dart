// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on _AddProductsStoreBase, Store {
  final _$productsAtom = Atom(name: '_AddProductsStoreBase.products');

  @override
  ObservableFuture<List<Product>> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableFuture<List<Product>> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$_AddProductsStoreBaseActionController =
      ActionController(name: '_AddProductsStoreBase');

  @override
  void reload() {
    final _$actionInfo = _$_AddProductsStoreBaseActionController.startAction(
        name: '_AddProductsStoreBase.reload');
    try {
      return super.reload();
    } finally {
      _$_AddProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
