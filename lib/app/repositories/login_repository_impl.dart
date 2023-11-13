import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  static const String apiUrl = '';

  final expectedName = 'target';
  final expectedPassword = '123456';

  @override
  Future<void> login({
    required String name,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    if (name == expectedName && password == expectedPassword) {
      return;
    }
    throw Exception('Usuário ou senha incorretos');
  }
}
