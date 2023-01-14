abstract class SignInState {}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSucessState extends SignInState {}

class SignInErrorState extends SignInState {
  final String massage;
  SignInErrorState(this.massage);
}
