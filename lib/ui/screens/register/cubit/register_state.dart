import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_demo/ui/cubit/common/base_state.dart';


part 'register_state.freezed.dart';

@freezed
abstract class RegisterState extends BaseState with _$RegisterState {

  const RegisterState._();
   
  const factory RegisterState({
    @Default(false) bool isSuccess,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _RegisterState;
}
