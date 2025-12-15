import 'package:equatable/equatable.dart';

enum LoginMethod { email, phone }

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Toggle email <-> phone
class ToggleMethod extends LoginEvent {
  final bool toEmail;

  ToggleMethod({required this.toEmail});

  @override
  List<Object?> get props => [toEmail];
}

// Input text change
class InputChanged extends LoginEvent {
  final String input;

  InputChanged(this.input);

  @override
  List<Object?> get props => [input];
}

// Request OTP
class RequestOtpPressed extends LoginEvent {}
