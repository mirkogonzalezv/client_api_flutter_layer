import 'package:client_api/client_api.dart';
import 'package:flutter_poc_network/features/users/data/models/user_response.dart';
import 'package:flutter_poc_network/features/users/domain/repositories/user_repository.dart';

import '../datasources/remote/user_remote_datasource.dart';

class UsersRepositoryImpl implements UsersRepository {
  @override
  Future<ApiResult<UserResponse>> getAllUsers() {
    // TODO: implement getAllUsers
    return UserRemoteDataSource.istance.getAllUsers();
  }
}
