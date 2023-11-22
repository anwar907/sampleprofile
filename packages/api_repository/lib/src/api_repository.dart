import 'package:api_repository/models/product_models.dart';
import 'package:api_repository/models/users_models.dart';
import 'package:api_repository/utils/api_method.dart';
import 'package:client_repository/client_repository.dart';

class ApiRepository implements CleintRepository {
  final ApiClient apiClient;
  ApiRepository({required this.apiClient});

  @override
  Future<UsersModel> login(
      {required String username, required String password}) async {
    final body = {"username": username, "password": password};
    try {
      final response = await apiClient.post('auth/login', body);

      return UsersModel.fromJson(response?.data);
    } on Exception catch (error, stackTrace) {
      throw Future.error(error, stackTrace);
    }
  }

  @override
  Future<UsersModel> userProfile({required int id}) async {
    try {
      final response = await apiClient.get('users/$id');

      return UsersModel.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Category> allProduct() async {
    try {
      final response = await apiClient.get('products');

      return Category.fromJson(response?.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
