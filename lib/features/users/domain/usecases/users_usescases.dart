import 'package:client_api/domain/models/api_result.dart';
import 'package:flutter_poc_network/features/users/data/models/user_response.dart';
import 'package:flutter_poc_network/features/users/domain/repositories/user_repository.dart';

import '../../data/datasources/remote/user_remote_datasource.dart';

class UsersUsesCasesImpl extends UsersRepository {
  @override
  Future<ApiResult<UserResponse>> getAllUsers() {
    return UserRemoteDataSource.istance.getAllUsers();
  }
}
