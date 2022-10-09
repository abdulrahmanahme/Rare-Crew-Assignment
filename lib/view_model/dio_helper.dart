import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rare_crew/services/cache_service.dart';

const base_Url = 'https://lavie.orangedigitalcenteregypt.com';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: base_Url,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheService.token}'
    };
    return await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    required String token,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheService.token}'
    };
    return await dio.get(
      url,
      queryParameters: queryParameters,
    );
  }
}
