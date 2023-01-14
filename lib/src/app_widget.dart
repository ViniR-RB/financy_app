import 'package:financy_app/core/constants/routes.dart';
import 'package:financy_app/core/themes/default_themes.dart';
import 'package:financy_app/src/modules/onboarding/onboarding_page.dart';
import 'package:financy_app/src/modules/sigin/sign_in_page.dart';
import 'package:financy_app/src/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'modules/signup/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      initialRoute: NamedRoutes.splash,
      debugShowCheckedModeBanner: false,
      routes: {
        NamedRoutes.initial: (context) => const OnBoardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
      },
    );
  }
}
