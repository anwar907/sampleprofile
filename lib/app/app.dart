import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/login_pages/bloc/login_bloc.dart';
import 'package:tokosebelah/app/modules/splash_page/cubit/splash_cubit.dart';
import 'package:tokosebelah/config/routes.dart';
import 'package:tokosebelah/themes/index.dart';
import 'package:users_repository/users_repository.dart';

import 'modules/login_pages/login_page.dart';
import 'modules/profile_page/bloc/profile_bloc.dart';
import 'modules/profile_page/profile_page.dart';
import 'modules/splash_page/view/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key, required UsersRespository usersRespository})
      : _usersRepository = usersRespository;

  final UsersRespository _usersRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: _usersRepository)],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginBloc>(
                  create: (_) => LoginBloc(usersRespository: _usersRepository)),
              BlocProvider<ProfileBloc>(
                  create: (_) =>
                      ProfileBloc(usersRespository: _usersRepository)),
              BlocProvider(create: (_) => SplashCubit())
            ],
            child: MaterialApp(
              title: 'Profile',
              theme: getAppTheme(context),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter().generateRoute,
              initialRoute: '/',
              routes: {
                Routes.splash: (context) => const SplashScreen(),
                Routes.login: (context) => const LoginPage(),
                Routes.profile: (context) => const ProfilePage()
              },
            )));
  }
}
