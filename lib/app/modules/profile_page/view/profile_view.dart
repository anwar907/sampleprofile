// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tokosebelah/app/modules/profile_page/bloc/profile_bloc.dart';
// import 'package:users_repository/users_repository.dart';

// class ProfileView extends StatelessWidget {
//   static const routeName = "/profile";
//   const ProfileView({super.key, this.id});
//   final int? id;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Profile'),
//         ),
//         body: BlocBuilder<ProfileBloc, ProfileState>(
//             bloc:
//                 ProfileBloc(usersRespository: context.read<UsersRespository>())
//                   ..add(ProfileEvent(id: id)),
//             builder: (context, state) {
//               return Column(
//                 children: [Text(state.profileModels?.email ?? '')],
//               );
//             }));
//   }
// }
