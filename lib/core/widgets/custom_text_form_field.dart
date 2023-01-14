import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

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
  final String? helperText;
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
      this.inputFormatters,
      this.helperText})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final _defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greenlightTwo));
  String? _helperText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
      child: TextFormField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              _helperText = null;
            });
          } else {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxlength,
        keyboardType: widget.textInputType,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          errorMaxLines: 3,
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
        controller: widget.controller,
      ),
    );
  }
}
