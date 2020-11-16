import 'dart:convert';

import 'package:dryve_exp/models/vehicle_data.dart';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));


class Vehicle {

  List<VehicleData> data;

  Vehicle({this.data});

  factory Vehicle.fromJson(List<dynamic> jsonArray) {
    List<VehicleData> data = [];
    for(var i =0; i < jsonArray.length; i++){
      data.add(VehicleData.fromJson(jsonArray[i]));
    }
    return Vehicle(data: data);
  }

}
