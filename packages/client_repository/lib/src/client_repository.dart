import 'package:api_repository/api_repository.dart';

abstract class CleintRepository {
  Future<UsersModel> login(
      {required String username, required String password});

  Future<UsersModel> userProfile({required int id});
}
