import 'package:dryve_exp/models/vehicle.dart';
import 'package:dryve_exp/service/vehicle_service.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_store.g.dart';

class VehicleStore = _VehicleStore with _$VehicleStore;

abstract class _VehicleStore with Store {

  final VehicleService _vehicleService;

  _VehicleStore(this._vehicleService);

  @observable
  ObservableFuture<Vehicle> results = ObservableFuture.value(new Vehicle(data: []));

  @action
  void getVehicles() {
    results = _vehicleService.getVehicle().asObservable();
  }
}