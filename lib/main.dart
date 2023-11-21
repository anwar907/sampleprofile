import 'package:api_repository/api_repository.dart';
import 'package:api_repository/utils/api_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:users_repository/users_repository.dart';

import 'package:tokosebelah/app/app.dart';

import 'utils/constans.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final optioin = BaseOptions(
    baseUrl: Const.baseUrl,
    receiveTimeout: const Duration(milliseconds: 3000),
    connectTimeout: const Duration(milliseconds: 5000),
  );

  final apiRepository =
      ApiRepository(apiClient: ApiClient(dioClient: Dio(optioin)));

  
  final usersRepository = UsersRespository(apiRespository: apiRepository);

  final app = App(
    
    usersRespository: usersRepository,
  );

  runApp(app);
}
