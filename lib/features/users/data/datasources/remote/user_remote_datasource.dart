import 'package:flutter_poc_network/commons/variables/api_variables.dart';
import 'package:client_api/client_api.dart';
import 'package:flutter_poc_network/features/users/data/models/user_response.dart';

import '../../../domain/repositories/user_repository.dart';

class UserRemoteDataSource implements UsersRepository {
  UserRemoteDataSource._privateConstructor();
  static final UserRemoteDataSource _instance =
      UserRemoteDataSource._privateConstructor();

  static UserRemoteDataSource get istance => _instance;

  static const Map<String, Object> _headers = {
    'Content-Type': 'application/json'
  };

  static final _baseUrl = ApiVariables.baseUrl;
  static const usersGetAllUrl = "/api/users";

  void init() {
    ApiClient.instance.init(
        baseUrl: _baseUrl + usersGetAllUrl,
        headers: _headers,
        interceptors: []);
  }

  @override
  Future<ApiResult<UserResponse>> getAllUsers() async {
    return ApiClient.instance.request(RequestApi.get(_baseUrl + usersGetAllUrl),
        (json) => UserResponse.fromJson(json));
  }
}
