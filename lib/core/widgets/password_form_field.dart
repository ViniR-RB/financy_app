// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:financy_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const PasswordFormField(
      {Key? key,
      this.controller,
      this.padding,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.validator,
      this.helperText})
      : super(key: key);

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      validator: widget.validator,
      helperText: widget.helperText,
      obscureText: isHidden,
      suffixIcon: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child:
              isHidden ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)),
    );
  }
}
