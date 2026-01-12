import 'api_client.dart';

class AuthApi {
  final ApiClient _client;

  AuthApi(this._client);

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final statusCode = response.statusCode ?? 0;

    if (statusCode < 200 || statusCode >= 300) {
      final data = response.data;
      String message = 'Login failed. Please try again.';
      if (data is Map && data['message'] is String) {
        message = data['message'] as String;
      }
      throw Exception(message);
    }
    if (response.data is! Map<String, dynamic>) {
      throw Exception('Invalid response from server');
    }
    return response.data as Map<String, dynamic>;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await _client.dio.post(
      '/auth/register',
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }
}
