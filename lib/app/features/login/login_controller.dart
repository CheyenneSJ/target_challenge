import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../app.dart';
part 'login_controller.g.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepository repository;
  _LoginControllerBase({required this.repository});
  @observable
  LoginState currentState = LoginState.initial;

  @action
  setCurrentState(LoginState value) => currentState = value;

  @action
  Future<void> login({
    required String name,
    required String password,
  }) async {
    try {
      setCurrentState(LoginState.loading);
      await repository.login(name: name, password: password);
      setCurrentState(LoginState.success);
    } on Exception catch (e) {
      setCurrentState(LoginState.error);
      log(e.toString());
    }
  }
}
