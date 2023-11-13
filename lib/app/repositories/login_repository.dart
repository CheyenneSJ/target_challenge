abstract interface class LoginRepository {
  Future<void> login({required String name, required String password});
}
