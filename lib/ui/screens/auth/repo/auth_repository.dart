import 'package:internship_demo/data/auth_api.dart';
import 'package:internship_demo/ui/screens/auth/model/user_model.dart';

class AuthRepository {
  final AuthApi api;

  AuthRepository({required this.api});

  Future<UserModel> login(String email, String password) async {
    final data = await api.login(email, password);

    return UserModel.fromJson(data["user"]);
  }

  Future<UserModel> register(String name, String email, String password) async {
    final data = await api.register(name, email, password);

    return UserModel.fromJson(data["user"]);
  }
}
