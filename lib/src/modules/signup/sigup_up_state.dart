abstract class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSucessState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  final String massage;
  SignUpErrorState(this.massage);
}
