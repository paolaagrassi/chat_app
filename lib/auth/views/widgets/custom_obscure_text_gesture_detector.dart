// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomObscureTextGestureDetector extends StatefulWidget {
  CustomObscureTextGestureDetector(
      {required this.obscureText, this.onTap, super.key});

  void Function()? onTap;
  bool obscureText;

  @override
  State<CustomObscureTextGestureDetector> createState() =>
      _CustomObscureTextGestureDetectorState();
}

class _CustomObscureTextGestureDetectorState
    extends State<CustomObscureTextGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: widget.obscureText
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }
}
