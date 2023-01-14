import 'package:flutter/material.dart';

import '../../../core/services/auth_service.dart';
import 'sigup_in_state.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;
  SignInState _state = SignInInitState();
  SignInController(this._service);

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners(); // Notifica que está ouvindo
  }

  Future<void> signIn({required String email, required String password}) async {
    _changeState(SignInLoadingState());
    try {
      await _service.signIn(email: email, password: password);
      _changeState(SignInSucessState());
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}
