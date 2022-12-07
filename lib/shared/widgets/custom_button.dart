// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chat_app/shared/widgets/widgets.dart';

class CustomButton implements GenericButton {
  final String? assetPath;
  @override
  final String buttonLabel;

  CustomButton({
    this.assetPath,
    required this.buttonLabel,
  });

  @override
  buildButtonLabel() {
    if (assetPath != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/google-icon.png',
              height: 24,
            ),
            CustomText(
              text: buttonLabel,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      );
    } else {
      return Text(buttonLabel);
    }
  }

  @override
  buildButton(bool autofocus, Color? foregroundColor, Color? backgroundColor,
      void Function()? onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        autofocus: autofocus,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: buildButtonLabel(),
      ),
    );
  }
}
