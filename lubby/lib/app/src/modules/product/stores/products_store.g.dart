// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsStore on _ProductsStoreBase, Store {
  final _$productsAtom = Atom(name: '_ProductsStoreBase.products');

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

  final _$_ProductsStoreBaseActionController =
      ActionController(name: '_ProductsStoreBase');

  @override
  dynamic add(Product product) {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.add');
    try {
      return super.add(product);
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reload() {
    final _$actionInfo = _$_ProductsStoreBaseActionController.startAction(
        name: '_ProductsStoreBase.reload');
    try {
      return super.reload();
    } finally {
      _$_ProductsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
