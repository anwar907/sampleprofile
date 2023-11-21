import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/login_pages/view/login_view.dart';
import 'package:tokosebelah/app/modules/splash_page/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 2), () {
      context.read<SplashCubit>().loadFinished();
    });

    return Scaffold(
      body: Center(
        child: BlocListener<SplashCubit, bool>(
          listener: (context, state) {
            if (state) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  ModalRoute.withName('/login'));
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
