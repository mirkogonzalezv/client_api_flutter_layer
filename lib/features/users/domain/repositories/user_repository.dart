import 'package:client_api/client_api.dart';

import '../../data/models/user_response.dart';

abstract class UsersRepository {
  Future<ApiResult<UserResponse>> getAllUsers();
}
