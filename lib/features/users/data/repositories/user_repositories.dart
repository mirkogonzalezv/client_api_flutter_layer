import 'package:flutter_poc_network/features/users/data/models/user_response.dart';

abstract class UsersRepository {
  Future<UserResponse> getAllUsers();
}
