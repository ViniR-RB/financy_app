import 'package:financy_app/src/core/themes/default_themes.dart';
import 'package:flutter/material.dart';

import 'modules/signup/signup_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: defaultTheme,
        home: const Scaffold(
          body: SignUpPage(),
        ));
  }
}
