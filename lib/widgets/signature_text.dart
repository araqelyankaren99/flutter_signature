import 'package:flutter/material.dart';

class SignatureTextWidget extends StatelessWidget {
  const SignatureTextWidget({
    super.key,
    required this.text,
    required this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
