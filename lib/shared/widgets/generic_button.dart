import 'package:flutter/material.dart';

abstract class GenericButton {
  final String buttonLabel;

  GenericButton(this.buttonLabel);

  buildButtonLabel() {
    return Text(buttonLabel);
  }

  buildButton(
      {bool? autofocus,
      Color? foregroundColor,
      Color? backgroundColor,
      void Function()? onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        autofocus: autofocus ?? false,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: buildButtonLabel(),
      ),
    );
  }
}
