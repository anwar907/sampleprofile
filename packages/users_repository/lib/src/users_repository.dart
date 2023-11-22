import 'package:api_repository/api_repository.dart';
import 'package:api_repository/utils/constans.dart';

/// {@template RepositoryException}
/// Generic [RepositoryException] thrown by the [UsersRespositoryException].
/// {@endtemplate}
class UsersRespositoryException extends RepositoryException {
  /// {@macro UsersRespositoryException}
  UsersRespositoryException(super.error, super.stackTrace);
}

/// {@template RepositoryException}
/// Generic [RepositoryException] thrown by the [UsersRespositoryException].
/// {@endtemplate}
class ProfileRepositoryException extends RepositoryException {
  /// {@macro ProfileRepositoryException}
  ProfileRepositoryException(super.error, super.stackTrace);
}

class UsersRespository {
  UsersRespository({required ApiRepository apiRespository})
      : _apiRespository = apiRespository;
  final ApiRepository _apiRespository;

  Future<UsersModel?> login(
      {required String username, required String password}) async {
    try {
      return await _apiRespository.login(
          username: username, password: password);
    } on Exception catch (error, stackTrace) {
      throw UsersRespositoryException(error, stackTrace);
    }
  }

  Future<UsersModel?> profile({required int id}) async {
    try {
      return await _apiRespository.userProfile(id: id);
    } on Exception catch (error, stackTrace) {
      throw ProfileRepositoryException(error, stackTrace);
    }
  }

  Future<Category> fetchProdcut() async {
    try {
      return await _apiRespository.allProduct();
    } on Exception catch (error, stackTrace) {
      throw UsersRespositoryException(error, stackTrace);
    }
  }
}
