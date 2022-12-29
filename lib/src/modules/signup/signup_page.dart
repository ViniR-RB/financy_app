import 'dart:developer';

import 'package:financy_app/src/core/utils/uppercase._text_format.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../core/widgets/custom_text_list_button.dart';
import '../../core/widgets/password_form_field.dart';
import '../../core/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
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
                  labelText: 'Your Name',
                  hintText: ' JOHN DOE',
                  inputFormatters: [
                    UpperCaseTextInputFormatter(),
                  ],
                  validator: (value) {
                    print(value);
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: 'Your Email',
                  hintText: 'moses@email.com',
                ),
                const PasswordFormField(
                  labelText: 'CHOOSE YOUR PASSWORD',
                  hintText: '*********',
                ),
                const PasswordFormField(
                  labelText: 'CONFIRM YOUR PASSWORD',
                  hintText: '*********',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          PrimaryButton(
              onPressed: () {
                final valid = _formkey.currentState!.validate();
                log(valid.toString());
              },
              label: 'Sign Up'),
          CustomTextListButton(
            onPressed: () {},
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
