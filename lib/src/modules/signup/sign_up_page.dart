import 'dart:developer';

import 'package:financy_app/core/utils/uppercase._text_format.dart';
import 'package:financy_app/core/utils/validator.dart';
import 'package:financy_app/src/modules/signup/sign_up_controller.dart';
import 'package:financy_app/src/modules/signup/sigup_up_state.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/routes.dart';
import '../../../core/locator.dart';
import '../../../core/services/mock_auth_service.dart';
import '../../../core/widgets/custom_buttom_sheet.dart';
import '../../../core/widgets/custom_circular_progress.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/custom_text_list_button.dart';
import '../../../core/widgets/password_form_field.dart';
import '../../../core/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _controller = locator.get<SignUpController>();
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CustomCircularProgressIndicator(),
              );
            });
      }
      if (_controller.state is SignUpSucessState) {
        Navigator.of(context).pop();
      }
      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
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
          SizedBox(
            height: 16,
          ),
          Text(
            'Start saving',
            style:
                TextStyles.mediumText.copyWith(color: AppColors.greenlightTwo),
          ),
          Text(
            'Your Money!',
            style:
                TextStyles.mediumText.copyWith(color: AppColors.greenlightTwo),
          ),
          Container(child: Image.asset('assets/images/sign_up_image.png')),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Your Name',
                  hintText: ' JOHN DOE',
                  inputFormatters: [
                    UpperCaseTextInputFormatter(),
                  ],
                  validator: Validator.valitadeName,
                ),
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
                PasswordFormField(
                  labelText: 'CONFIRM YOUR PASSWORD',
                  hintText: '*********',
                  validator: (value) => Validator.validateConfirmPassword(
                    passwordValue: _passwordController.text,
                    confirmPasswordValue: value,
                  ),
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
                  _controller.signUp(
                      email: _emailController.text,
                      name: _nameController.text,
                      password: _passwordController.text);
                } else {
                  log('Error');
                }
              },
              label: 'Sign Up'),
          CustomTextListButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, NamedRoutes.signIn);
            },
            children: [
              Text(
                'Already have account? ',
                style: TextStyles.thinText.copyWith(color: AppColors.grey),
              ),
              Text(
                'Sig-In',
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
