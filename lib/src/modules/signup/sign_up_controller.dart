import 'dart:developer';

import 'package:financy_app/src/modules/signup/sigup_up_state.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    log('Logado');
    _changeState(SignUpSucessState());
    return true;
  }
}
