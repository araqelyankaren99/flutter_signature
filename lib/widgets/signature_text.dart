import 'package:flutter/material.dart';

class SignatureTextWidget extends StatelessWidget {
  const SignatureTextWidget({
    super.key,
    required this.signatureText,
    required this.fontWeight,
    required this.color,
  });

  final String signatureText;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      signatureText,
      style: TextStyle(
          fontSize: 40,
          color: color,
          fontWeight: fontWeight,
      ),
    );
  }
}
