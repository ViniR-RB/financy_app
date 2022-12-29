import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_colors.dart';
import '../app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? labelText;
  final String? hintText;
  final int? maxlength;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  CustomTextFormField(
      {Key? key,
      this.padding,
      this.labelText,
      this.hintText,
      this.maxlength,
      this.textCapitalization,
      this.textInputType,
      this.textInputAction,
      this.suffixIcon,
      this.controller,
      this.obscureText,
      this.validator,
      this.inputFormatters})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenlightTwo));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
      child: TextFormField(
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxlength,
        keyboardType: widget.textInputType,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          labelText: widget.labelText!.toUpperCase(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyles.thinText.copyWith(color: AppColors.grey),
          border: _defaultBorder,
          focusedBorder: _defaultBorder,
          errorBorder: _defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: _defaultBorder,
          disabledBorder: _defaultBorder,
        ),
        // controller: _nameController,
      ),
    );
  }
}
