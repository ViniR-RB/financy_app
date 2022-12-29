import 'package:flutter/material.dart';

class CustomTextListButton extends StatelessWidget {
  final List<Text> children;
  final VoidCallback? onPressed;
  const CustomTextListButton({
    required this.children,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children),
    );
  }
}
