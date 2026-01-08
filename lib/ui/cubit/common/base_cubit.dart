import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  /// Wrapper cho API call
  Future<void> runAsync({
    required Future<void> Function() action,
    required S Function(bool isLoading, String? error) onStateChanged,
    String defaultErrorMessage = 'Something went wrong',
  }) async {
    emit(onStateChanged(true, null));

    try {
      await action();
      emit(onStateChanged(false, null));
    } catch (e) {
      emit(onStateChanged(false, _mapError(e, defaultErrorMessage)));
    }
  }

  String _mapError(Object e, String fallback) {
    final message = e.toString();

    if (message.contains('Invalid credentials')) {
      return 'Login failed. Account does not exist.';
    }

    if (message.contains('Network')) {
      return 'No internet connection';
    }

    return fallback;
  }
}
