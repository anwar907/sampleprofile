import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_repository/users_repository.dart';
import 'package:tokosebelah/utils/constans.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UsersRespository usersRespository})
      : _usersRespository = usersRespository,
        super(const LoginState()) {
    on<LoginEvent>(login);
  }
  final UsersRespository _usersRespository;

  Future<void> login(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      final response = await _usersRespository.login(
          username: event.username ?? '', password: event.password ?? '');

      emit(state.copyWith(loginModels: response, status: GlobalSatus.success));
    } catch (e) {
      emit(state.copyWith(status: GlobalSatus.failure));
    }
  }
}
