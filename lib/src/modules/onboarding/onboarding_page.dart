import 'package:financy_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/routes.dart';
import '../../../core/widgets/custom_text_list_button.dart';
import '../../../core/widgets/primary_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: Container(
              child: Image.asset('assets/images/onboarding_image.png'),
            ),
          ),
          Column(
            children: [
              Text(
                'Spend Smarter',
                style: TextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo),
              ),
              Text(
                'Save More',
                style: TextStyles.mediumText
                    .copyWith(color: AppColors.greenlightTwo),
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.pushNamed(context, NamedRoutes.signUp);
                },
                label: 'Get Started',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextListButton(
                onPressed: () {
                  Navigator.pushNamed(context, NamedRoutes.signIn);
                },
                children: [
                  Text(
                    'Already have account? ',
                    style: TextStyles.thinText.copyWith(color: AppColors.grey),
                  ),
                  Text(
                    'Sign-In',
                    style: TextStyles.thinText
                        .copyWith(color: AppColors.greenlightTwo),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
