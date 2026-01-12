
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_demo/ui/cubit/common/base_state.dart';


part 'login_state.freezed.dart';

@freezed
abstract class LoginState extends BaseState with _$LoginState {

  const LoginState._();
 
 const factory LoginState({
  @Default(false) bool isSuccess,
  @Default(false) bool isLoading,
  String? errorMessage,

 }) = _LoginState;
}

