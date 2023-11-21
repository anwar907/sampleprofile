import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokosebelah/utils/constans.dart';
import 'package:users_repository/users_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required UsersRespository usersRespository})
      : _usersRespository = usersRespository,
        super(const ProfileState()) {
    on<ProfileEvent>(getProfile);
  }

  final UsersRespository _usersRespository;

  Future<void> getProfile(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      final response = await _usersRespository.profile(id: event.id ?? 0);
      log('message ${response?.email}');
      emit(
          state.copyWith(profileModels: response, status: GlobalSatus.success));
    } catch (e) {
      emit(state.copyWith(status: GlobalSatus.failure));
    }
  }
}
