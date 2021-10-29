import 'package:dio/dio.dart';
import'package:flutter/material.dart';
//import 'package:http/http.dart';
//FOR SHOP APP

class DioHelperShopApp {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang':'en',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      // 'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> PostData({
    required String url,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      //'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return  dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}

