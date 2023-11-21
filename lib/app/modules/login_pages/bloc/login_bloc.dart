import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokosebelah/utils/constans.dart';
import 'package:users_repository/users_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UsersRespository usersRespository})
      : _usersRespository = usersRespository,
        super(const LoginState()) {
    on<LoginEvent>(login);
  }
  final UsersRespository _usersRespository;

  /// Performs the login operation.
  ///
  /// Takes a [LoginEvent] and an [Emitter<LoginState>] as parameters.
  /// Updates the state with a loading status.
  /// Attempts to login using the given username and password.
  /// Saves the token and id to SharedPreferences.
  /// Updates the state with the login response and a success status.
  /// If an exception occurs, updates the state with a failure status.
  Future<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        status: GlobalSatus.loading)); // Update state with loading status
    try {
      final SharedPreferences sharp = await SharedPreferences.getInstance();

      // Attempt to login using the given username and password
      final response = await _usersRespository.login(
          username: event.username ?? '', password: event.password ?? '');

      // Save [token] and [id] to SharedPreferences
      sharp.setString('token', response?.token ?? '');
      sharp.setInt('id', response?.id ?? 0);

      emit(state.copyWith(
          loginModels: response,
          status: GlobalSatus
              .success)); // Update state with login response and success status
    } catch (e) {
      emit(state.copyWith(
          status: GlobalSatus.failure)); // Update state with failure status
    }
  }
}
