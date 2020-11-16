import 'package:dio/dio.dart';
import 'package:dryve_exp/api_routes/api_route.dart';
import 'package:dryve_exp/models/brand.dart';

class BrandService {
  Dio dio = new Dio();

  Future<Brand> getBrands() async {
    try{
      final response = await dio.get('${ApiRoute.baseUrl}${ApiRoute.brandUrl}');
      return Brand.fromArrayJson(response.data);
    } catch(e){
      print(e);
      rethrow;
    }
  }

}