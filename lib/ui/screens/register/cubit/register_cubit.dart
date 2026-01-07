import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_demo/ui/screens/auth/repo/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;

  RegisterCubit(this.repository) : super(RegisterInitial());

  Future<void> submit(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      await repository.register(name, email, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  // (Tuỳ chọn) nếu muốn reset state về initial
  void reset() => emit(RegisterInitial());
}
