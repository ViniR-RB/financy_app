import 'package:financy_app/core/services/auth_service.dart';
import 'package:financy_app/core/services/fireabse_auth_service.dart';
import 'package:financy_app/src/modules/sigin/sign_in_controller.dart';
import 'package:financy_app/src/modules/signup/sign_up_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependecies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuhService());

  locator.registerFactory<SignInController>(
      () => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}
