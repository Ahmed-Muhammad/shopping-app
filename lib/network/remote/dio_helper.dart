import 'package:dio/dio.dart';

//----------------------------Create Data----------------------------------------
class DioHelper {
  static Dio? dio;

  static init() {
    BaseOptions options = BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: false,
        headers: {
          'Content-Type': 'application/json',
        });
    dio = Dio(options);
  }

  //----------------------------Post Data----------------------------------------

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
  }) async {
    dio!.options = BaseOptions(
      headers: {'lang': lang},
    );
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

//----------------------------Get Data----------------------------------------

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
