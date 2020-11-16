import 'package:dio/dio.dart';
import 'package:dryve_exp/api_routes/api_route.dart';
import 'package:dryve_exp/models/vehicle.dart';

class VehicleService {
  Dio dio = new Dio();

  Future<Vehicle> getVehicle() async {
    try {
      final response = await dio.get('${ApiRoute.baseUrl}${ApiRoute.vehicleUrl}');
      print(response.data.toString());
      return Vehicle.fromJson(response.data);

    } catch (e){
      print(e);
      rethrow;
    }

  }
}
