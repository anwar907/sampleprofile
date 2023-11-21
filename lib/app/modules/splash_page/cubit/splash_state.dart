import 'package:equatable/equatable.dart';

class VariableState extends Equatable {
  const VariableState({this.isLogin, this.value});
  final int? value;
  final bool? isLogin;

  VariableState copyWith({int? value, bool? isLogin}) {
    return VariableState(
      value: value ?? this.value,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLogin, value];
}
