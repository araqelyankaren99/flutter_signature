import 'package:flutter/material.dart';
import 'package:flutter_signature/constants.dart';
import 'package:signature/signature.dart';

class SignatureBodyWidget extends StatelessWidget {
  const SignatureBodyWidget({
    super.key,
    required this.signatureController,
  });

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
