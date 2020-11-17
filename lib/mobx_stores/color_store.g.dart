// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorStore on _ColorStore, Store {
  final _$resultsAtom = Atom(name: '_ColorStore.results');

  @override
  ObservableFuture<Color> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<Color> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_ColorStoreActionController = ActionController(name: '_ColorStore');

  @override
  void getColors() {
    final _$actionInfo = _$_ColorStoreActionController.startAction(
        name: '_ColorStore.getColors');
    try {
      return super.getColors();
    } finally {
      _$_ColorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results}
    ''';
  }
}
