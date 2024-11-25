import 'package:check_in/src/presentation/widgets/global/input/custom_text_font.dart';
import 'package:flutter/material.dart';

class SignatureTextWidget extends StatelessWidget {
  const SignatureTextWidget({
    Key? key,
    required this.signatureText,
    required this.fontWeight,
    required this.color,
  }) : super(key: key);

  final String signatureText;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      signatureText,
      style: CustomTextFont.textStyle(
        textStyle: TextStyle(
          fontSize: 40,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
