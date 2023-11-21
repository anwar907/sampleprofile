import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokosebelah/app/modules/profile_page/bloc/profile_bloc.dart';
import 'package:tokosebelah/app/modules/profile_page/view/profile_view.dart';
import 'package:users_repository/users_repository.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "/profile";
  const ProfilePage({super.key, this.id});
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
        create: (_) =>
            ProfileBloc(usersRespository: context.read<UsersRespository>())
              ..add(ProfileEvent(id: id)),
        child: ProfileView());
  }
}
