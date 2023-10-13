import 'package:dio/dio.dart';

class DioHelper{
  static late var BASE_URL = "https://accept.paymob.com/api";
  static late Dio dio;

  static initDio(){
    dio = Dio(
      // BaseOptions(
      //   baseUrl: BASE_URL,
      //   headers: {
      //     'Content-Type':'Application/json',
      //   },
      //   receiveDataWhenStatusError: true
      // ),
        BaseOptions (
          baseUrl: BASE_URL,
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
        )

    );
}

static Future<Response> postAuthData({required String endPoint , Map<String , dynamic>? data }) async{
    return await dio.post("$BASE_URL$endPoint", data: data);
}
}