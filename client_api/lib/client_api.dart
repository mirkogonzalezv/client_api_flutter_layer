import 'dart:developer';

import 'package:client_api/api/domain/model/api_result.dart';
import 'package:client_api/api/request.dart';
import 'package:dio/dio.dart';

class ClientApi {
  ClientApi._privateConstructor();
  static final ClientApi _instance = ClientApi._privateConstructor();
  static ClientApi get instance => _instance;
  late Dio dio;

  void init(
      {required String baseUrl,
      required Map<String, dynamic>? headers,
      List<Interceptor>? intereceptors}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: Duration(milliseconds: 25000),
        receiveTimeout: Duration(milliseconds: 25000),
      ),
    );

    if (intereceptors != null) {
      _instance.dio.interceptors.addAll(intereceptors);
    }
  }

  Future<ApiResult<T>> request<T>(
      ApiRequest request, Function(dynamic) fromJson) async {
    try {
      final response = await _instance.dio.request(
        request.url,
        data: request.body,
        queryParameters: request.queryParameters,
        options: Options(method: request.method, headers: request.headers),
      );

      return ApiResult.exito(
        data: fromJson(response.data),
      );
    } on Exception catch (e) {
      log(e.toString());
      log(request.url);
      return ApiResult.error(error: e);
    }
  }
}
