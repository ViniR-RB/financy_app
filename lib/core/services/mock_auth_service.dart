import 'dart:developer';

import 'package:financy_app/core/models/user_model.dart';

import 'auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      log('Logou');
      final UserModel user = UserModel(
        name: '',
        id: email.hashCode.toString(),
        email: email,
      );

      return user;
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar, tente novamente';
      }
      throw 'Não foi possível iniciar seu login,Tente mais tarde';
    }
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith('123')) {
        throw Exception();
      }
      log('Logou');
      final UserModel user = UserModel(
        id: email.hashCode.toString(),
        name: name,
        email: email,
      );

      return user;
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha Fraca, Tente uma Nova Senha';
      }
      throw 'Não Foi Possível Criar Sua Conta,Tente Mais Tarde';
    }
  }
}
