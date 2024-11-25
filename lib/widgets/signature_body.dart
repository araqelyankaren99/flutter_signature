import 'package:check_in/src/utils/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureBodyWidget extends StatelessWidget {
  const SignatureBodyWidget({
    Key? key,
    required this.signatureController,
  }) : super(key: key);

  final SignatureController signatureController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Signature(
            controller: signatureController,
            backgroundColor: cSignatureBackgroundColor,
            height: constraints.biggest.height,
            width: constraints.biggest.width,
          );
        },
    );
  }
}
