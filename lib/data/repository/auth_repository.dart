import 'package:internship_demo/data/api/auth_api.dart';
import 'package:internship_demo/foundation/storage/token_storage.dart';

class AuthRepository {
  final AuthApi _api;
  final TokenStorage _storage;
  AuthRepository(this._api, this._storage);

  Future<void> login(String email, String password) async {
    final data = await _api.login(
      email: email,
      password: password,
    );
    

    await _storage.saveTokens(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }

  Future<void> register(String name, String email, String password) async {
    await _api.register(name: name, email: email, password: password);
  }

  Future<void> logout() async {
    await _storage.clear();
  }
}
