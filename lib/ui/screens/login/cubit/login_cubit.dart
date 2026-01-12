import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../../../../data/repository/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    ));

    try {
      await authRepository.login(
        email,
        password,
      );

      emit(state.copyWith(
        isSuccess: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }

  void resetSuccess() {
    emit(state.copyWith(isSuccess: false));
  }

  void reset() {
    emit(LoginState());
  }
}
