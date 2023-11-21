part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = GlobalSatus.initial,
      this.loginModels,
      this.errorMessage = "Login Invalid"});

  final GlobalSatus status;
  final UsersModel? loginModels;
  final String? errorMessage;

  LoginState copyWith({
    GlobalSatus? status,
    UsersModel? loginModels,
    String? errorMessage,
  }) {
    return LoginState(
        status: status ?? this.status,
        loginModels: loginModels ?? this.loginModels,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, loginModels, errorMessage];
}
