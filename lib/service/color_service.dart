import 'package:dio/dio.dart';
import 'package:dryve_exp/api_routes/api_route.dart';
import 'package:dryve_exp/models/color.dart';

class ColorService {
  Dio dio = new Dio();

  Future<Color> getColors() async {
    try {
      final response =
          await dio.get('${ApiRoute.baseUrl}${ApiRoute.colorsUrl}');
      return Color.fromArrayJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
