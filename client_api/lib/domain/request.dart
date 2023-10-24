import 'package:client_api/domain/models/enums/http_method.dart';

class RequestApi {
  final String url;
  final String method;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  final dynamic body;

  RequestApi(
      {required this.url,
      required this.method,
      this.queryParameters,
      this.headers,
      this.body});

  factory RequestApi.get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return RequestApi(
        url: url,
        method: HttpMethod.get,
        headers: headers,
        queryParameters: queryParameters);
  }

  factory RequestApi.post(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return RequestApi(
        url: url,
        method: HttpMethod.post,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory RequestApi.put(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return RequestApi(
        url: url,
        method: HttpMethod.put,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory RequestApi.patch(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      dynamic body}) {
    return RequestApi(
        url: url,
        method: HttpMethod.patch,
        headers: headers,
        queryParameters: queryParameters,
        body: body);
  }

  factory RequestApi.delete(String url,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    return RequestApi(
        url: url,
        method: HttpMethod.delete,
        headers: headers,
        queryParameters: queryParameters);
  }
}
