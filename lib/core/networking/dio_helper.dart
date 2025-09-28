import 'dart:math';

import 'package:dio/dio.dart';
import 'package:news_app/core/networking/dio_end_points.dart';

class DioHelper {
  static Dio? dio;
  static initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: DioEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  getRequest({
    required String endPoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    }catch (e) {
      print(e.toString());
    }
  }

  postRequest({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await dio!.post(endPoint, data: data);
      return response;
    }catch (e) {
      print(e.toString());
    }
  }
}
