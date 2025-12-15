import 'package:equatable/equatable.dart';
import 'login_event.dart';

class LoginState extends Equatable {
  final String input;
  final LoginMethod method;
  final bool otpSent;
  final String? error;
  final bool isSubmitting;

  const LoginState({
    this.input = "",
    this.method = LoginMethod.email,
    this.otpSent = false,
    this.error,
    this.isSubmitting = false,
  });

  LoginState copyWith({
    String? input,
    LoginMethod? method,
    bool? otpSent,
    String? error,
    bool? isSubmitting,
  }) {
    return LoginState(
      input: input ?? this.input,
      method: method ?? this.method,
      otpSent: otpSent ?? this.otpSent,
      error: error,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [input, method, otpSent, error, isSubmitting];
}
