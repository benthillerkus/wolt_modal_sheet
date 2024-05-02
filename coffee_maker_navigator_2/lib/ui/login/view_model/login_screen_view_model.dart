import 'package:coffee_maker_navigator_2/domain/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';

class LoginScreenViewModel extends ChangeNotifier {
  final AuthService authService;

  LoginScreenViewModel({required this.authService});

  Future<void> logIn(String email, String password) async {
    await authService.logIn(email, password);
  }
}
