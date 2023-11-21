import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/login_pages/bloc/login_bloc.dart';
import 'package:tokosebelah/app/modules/profile_page/profile_page.dart';
import 'package:tokosebelah/core/textform_widget.dart';
import 'package:tokosebelah/utils/constans.dart';

class LoginView extends StatelessWidget {
  static const routeName = "/login";
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormTextInput(
              controller: emailController,
              onChanged: (value) {
                emailController.text = value;
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            FormSecureTextInput(
              controller: passwordController,
              onChanged: (value) {
                passwordController.text = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == GlobalSatus.success) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProfilePage(
                                  id: state.loginModels?.id,
                                )),
                        ModalRoute.withName("/profile"));
                  }

                  if (state.status == GlobalSatus.failure) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Center(
                                child: Text('Alert'),
                              ),
                              actions: [
                                OutlinedButton(
                                    onPressed: () {
                                      emailController.clear();
                                      passwordController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close')),
                              ],
                              content: Text(state.errorMessage ?? ''),
                            ));
                  }
                },
                child: Hero(
                    tag: 'hero-custom-tween',
                    createRectTween: (Rect? begin, Rect? end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    child: OutlinedButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            context.read<LoginBloc>().add(LoginEvent(
                                username: emailController.text,
                                password: passwordController.text));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Center(
                                        child: Text('Alert'),
                                      ),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close')),
                                      ],
                                      content: const Text(
                                          'User ID dan atau Password anda belum diisi'),
                                    ));
                          }
                        },
                        child: const Text('Login')))),
          ],
        ),
      ),
    )));
  }
}
