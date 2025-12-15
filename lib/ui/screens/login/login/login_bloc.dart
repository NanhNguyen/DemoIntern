import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/repo/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginState()) {
    on<ToggleMethod>(_onToggleMethod);
    on<InputChanged>(_onInputChanged);
    on<RequestOtpPressed>(_onRequestOtpPressed);
  }

  void _onToggleMethod(ToggleMethod event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        method: event.toEmail ? LoginMethod.email : LoginMethod.phone,
        input: "",
        error: null,
      ),
    );
  }

  void _onInputChanged(InputChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(input: event.input, error: null));
  }

  Future<void> _onRequestOtpPressed(
    RequestOtpPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (state.input.isEmpty) {
      emit(state.copyWith(error: "Input cannot be empty"));
      return;
    }

    emit(state.copyWith(isSubmitting: true, error: null));

    // Mock OTP request — sau này kết nối BE sẽ sửa tại đây
    await Future.delayed(const Duration(milliseconds: 700));

    emit(state.copyWith(otpSent: true, isSubmitting: false));
  }
}
