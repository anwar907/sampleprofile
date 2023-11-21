import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/login_pages/view/login_view.dart';
import 'package:tokosebelah/app/modules/profile_page/profile_page.dart';
import 'package:tokosebelah/app/modules/splash_page/cubit/splash_cubit.dart';

import '../cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 2), () {
      context.read<SplashCubit>().updateBoolVariable();
    });

    return Scaffold(
      body: Center(
        child: BlocListener<SplashCubit, VariableState>(
          listener: (context, state) {
            if (state.isLogin == false) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  ModalRoute.withName('/login'));
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(id: state.value),
                  ),
                  ModalRoute.withName('/profile'));
            }
          },
          child: const SafeArea(
              child: Center(
            child: CircularProgressIndicator(),
          )),
        ),
      ),
    );
  }
}
