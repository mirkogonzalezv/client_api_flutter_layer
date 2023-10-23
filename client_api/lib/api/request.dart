import 'package:client_api/api/domain/enums/http_methods.dart';

class ApiRequest {
  final String url;
  final String method;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final dynamic body;

  ApiRequest(
      {required this.url,
      required this.method,
      this.queryParameters,
      this.headers,
      this.body});

  factory ApiRequest.get(String url,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return ApiRequest(
        url: url,
        method: HttpMethod.get,
        headers: headers,
        queryParameters: queryParameters);
  }

  factory ApiRequest.post(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return ApiRequest(
        url: url,
        method: HttpMethod.post,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory ApiRequest.put(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return ApiRequest(
        url: url,
        method: HttpMethod.put,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory ApiRequest.patch(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return ApiRequest(
        url: url,
        method: HttpMethod.patch,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory ApiRequest.delete(String url,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return ApiRequest(
        url: url,
        method: HttpMethod.delete,
        headers: headers,
        queryParameters: queryParameters);
  }
}
