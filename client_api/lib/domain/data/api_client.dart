import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:client_api/domain/request.dart';
import '../models/api_result.dart';

class ApiClient {
  ApiClient._privateConstructor();
  static final ApiClient _instance = ApiClient._privateConstructor();
  static ApiClient get instance => _instance;
  Dio dio = Dio();

  void init(
      {required String baseUrl,
      required Map<String, dynamic>? headers,
      List<Interceptor>? interceptors}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(milliseconds: 25000),
        receiveTimeout: const Duration(milliseconds: 25000),
      ),
    );

    if (interceptors != null) {
      _instance.dio.interceptors.addAll(interceptors);
    }
  }

  Future<ApiResult<T>> request<T>(
      RequestApi requestApi, Function(dynamic) fromJson) async {
    try {
      final response = await _instance.dio.request(
        requestApi.url,
        data: requestApi.body,
        queryParameters: requestApi.queryParameters,
        options:
            Options(method: requestApi.method, headers: requestApi.headers),
      );

      return ApiResult.exito(
        data: fromJson(response.data),
      );
    } on Exception catch (e) {
      log(e.toString());
      log(requestApi.url);
      return ApiResult.fallo(error: e);
    }
  }
}
