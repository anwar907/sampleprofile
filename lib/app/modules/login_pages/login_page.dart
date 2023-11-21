import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_repository/users_repository.dart';
import 'package:tokosebelah/app/modules/login_pages/bloc/login_bloc.dart';
import 'package:tokosebelah/app/modules/login_pages/view/login_view.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(usersRespository: context.read<UsersRespository>()),
        child: LoginView());
  }
}
