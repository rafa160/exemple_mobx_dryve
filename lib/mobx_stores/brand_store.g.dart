// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrandStore on _BrandStore, Store {
  final _$resultsAtom = Atom(name: '_BrandStore.results');

  @override
  ObservableFuture<Brand> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<Brand> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_BrandStoreActionController = ActionController(name: '_BrandStore');

  @override
  void getBrands() {
    final _$actionInfo = _$_BrandStoreActionController.startAction(
        name: '_BrandStore.getBrands');
    try {
      return super.getBrands();
    } finally {
      _$_BrandStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results}
    ''';
  }
}
