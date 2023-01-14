import 'package:financy_app/src/modules/signup/sigup_up_state.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(this._service);
  SignUpState _state = SignUpInitState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners(); // Notifica que está ouvindo
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    _changeState(SignUpLoadingState());
    try {
      await _service.signUp(name: name, email: email, password: password);
      _changeState(SignUpSucessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
