import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    BaseOptions options = BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        });
    dio = Dio(options);
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
