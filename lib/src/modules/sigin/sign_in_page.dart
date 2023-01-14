import 'dart:developer';

import 'package:financy_app/core/constants/routes.dart';
import 'package:financy_app/core/utils/validator.dart';
import 'package:financy_app/src/modules/sigin/sign_in_controller.dart';
import 'package:financy_app/src/modules/sigin/sigup_in_state.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/mock_auth_service.dart';
import '../../../core/widgets/custom_buttom_sheet.dart';
import '../../../core/widgets/custom_circular_progress.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_list_button.dart';
import '../../../core/widgets/password_form_field.dart';
import '../../../core/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final _controller = SignInController(MockAuthService());
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            });
      }
      if (_controller.state is SignInSucessState) {
        Navigator.of(context).pop();
      }
      if (_controller.state is SignInErrorState) {
        final error = _controller.state as SignInErrorState;
        Navigator.of(context).pop();
        customBottomSheet(context, error.massage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            'Welcome',
            style:
                TextStyles.mediumText.copyWith(color: AppColors.greenlightTwo),
          ),
          Text(
            'Back!',
            style:
                TextStyles.mediumText.copyWith(color: AppColors.greenlightTwo),
          ),
          Image.asset('assets/images/sign_in_image.png'),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Your Email',
                  hintText: 'moses@email.com',
                  validator: Validator.valitadeEmail,
                ),
                PasswordFormField(
                  labelText: 'CHOOSE YOUR PASSWORD',
                  hintText: '*********',
                  controller: _passwordController,
                  helperText:
                      'Must have at least 8 characters, 1 capital letter and 1 number.',
                  validator: Validator.valitadePassword,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          PrimaryButton(
              onPressed: () {
                final valid = _formkey.currentState != null &&
                    _formkey.currentState!.validate();

                if (valid) {
                  _controller.signIn(
                      email: _emailController.text,
                      password: _passwordController.text);
                } else {
                  log('Error');
                }
              },
              label: 'Sign In'),
          CustomTextListButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, NamedRoutes.signUp);
            },
            children: [
              Text(
                """Don't have an account?""",
                style: TextStyles.thinText.copyWith(color: AppColors.grey),
              ),
              Text(
                ' Sign-Up',
                style: TextStyles.thinText
                    .copyWith(color: AppColors.greenlightTwo),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
