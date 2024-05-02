import 'dart:async';

import 'package:coffee_maker_navigator_2/data/auth/repository/auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;

  final StreamController<bool> _loginController = StreamController<bool>.broadcast();

  AuthService({required this.authRepository});

  Stream<bool> authStateChanges() {
    return _loginController.stream;
  }

  Future<void> logOut() async {
    await authRepository.logOut();
    _loginController.add(false);
  }

  Future<void> logIn(String email, String password) async {
    await authRepository.logIn(email, password);
    _loginController.add(true);
  }
}
