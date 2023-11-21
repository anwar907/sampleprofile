import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokosebelah/app/modules/splash_page/cubit/splash_state.dart';

class SplashCubit extends Cubit<VariableState> {
  SplashCubit() : super(const VariableState(isLogin: false));

  /// Update [bool] variable based on the presence of a token.
  /// If token is present, set [isLogin] to true and [value] to [id].
  /// If token is null, set [isLogin] to false and [value] to 0.
  Future<void> updateBoolVariable() async {
    final SharedPreferences shared = await SharedPreferences.getInstance();

    // Retrieve the token from shared preferences
    final token = shared.getString('token');

    // Retrieve the id from shared preferences
    final id = shared.getInt('id');

    if (token == null) {
      // Update the state with isLogin set to false and value set to 0
      emit(state.copyWith(isLogin: false, value: 0));
    } else {
      // Update the state with isLogin set to true and value set to id
      emit(state.copyWith(isLogin: true, value: id));
    }
  }
}
