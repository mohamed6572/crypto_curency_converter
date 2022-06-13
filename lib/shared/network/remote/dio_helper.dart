import 'package:dio/dio.dart';

class Dio_Helper {
  static late Dio dio;
  static late Dio dio1;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.apilayer.com/fixer/',
        receiveDataWhenStatusError: true));
    dio1 = Dio(BaseOptions(
        baseUrl: 'https://api.coingecko.com/api/',
        receiveDataWhenStatusError: true));
  }
  static Future<Response> getDataforconvert({required String url,
    Map<String, dynamic>? query,
  }) async {


    return await dio.get(url, queryParameters: query);
  }
 static Future<Response> getDataforCrypto({required String url,
    Map<String, dynamic>? query,
  }) async {


    return await dio1.get(url, queryParameters: query);
  }


}



