import 'dart:async';

import 'package:financy_app/core/constants/routes.dart';
import 'package:financy_app/core/widgets/custom_circular_progress.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigateToOnboardinpage);
  }

  void navigateToOnboardinpage() {
    Navigator.pushReplacementNamed(context, NamedRoutes.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Financy',
              style: TextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
