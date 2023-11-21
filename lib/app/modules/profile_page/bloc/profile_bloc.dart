import 'package:api_repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  /// Retrieves the profile based on the given [event] and emits the [ProfileState].
  Future<void> getProfile(
      ProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      final response = await _usersRespository.profile(id: event.id ?? 0);

      emit(
          state.copyWith(profileModels: response, status: GlobalSatus.success));
    } catch (e) {
      emit(state.copyWith(status: GlobalSatus.failure));
    }
  }

  /// Logs the user out by removing the 'token' and 'id' from SharedPreferences.
  ///
  /// Returns a Future that completes when the user is logged out.
  Future<void> logOut() async {
    final SharedPreferences sharp = await SharedPreferences.getInstance();

    // Remove the 'token' from SharedPreferences
    sharp.remove('token');

    // Remove the 'id' from SharedPreferences
    sharp.remove('id');
  }
}
