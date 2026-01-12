import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_demo/data/repository/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;

  RegisterCubit(this.repository) : super(RegisterState());

  Future<void> submit(
    String name,
    String email,
    String password,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    ));
    try {
      await repository.register(
        name,
        email,
        password,
      );
      emit(state.copyWith(
        isSuccess: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        errorMessage: e.toString(),
        isLoading: false,
      ));
    }
  }

  void reset() => emit(RegisterState());
}
