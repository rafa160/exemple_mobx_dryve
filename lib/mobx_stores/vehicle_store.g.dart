// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VehicleStore on _VehicleStore, Store {
  final _$resultsAtom = Atom(name: '_VehicleStore.results');

  @override
  ObservableFuture<Vehicle> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableFuture<Vehicle> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_VehicleStoreActionController =
      ActionController(name: '_VehicleStore');

  @override
  void getVehicles() {
    final _$actionInfo = _$_VehicleStoreActionController.startAction(
        name: '_VehicleStore.getVehicles');
    try {
      return super.getVehicles();
    } finally {
      _$_VehicleStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
results: ${results}
    ''';
  }
}
