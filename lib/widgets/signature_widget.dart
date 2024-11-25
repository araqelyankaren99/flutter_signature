import 'package:flutter/material.dart';
import 'package:flutter_signature/constants.dart';
import 'package:flutter_signature/widgets/empty.dart';
import 'package:flutter_signature/widgets/signature_body.dart';
import 'package:flutter_signature/widgets/signature_builder.dart';
import 'package:flutter_signature/widgets/signature_button.dart';
import 'package:flutter_signature/widgets/signature_text.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({
    super.key,
    required this.signatureController,
    required this.signatureHintText,
    required this.signatureBorderColor,
    this.signatureButtonHeight = 70,
    this.signatureButtonPadding = const EdgeInsets.only(right: 10, top: 10),
  });

  final SignatureController signatureController;
  final String signatureHintText;
  final double signatureButtonHeight;
  final EdgeInsets signatureButtonPadding;
  final Color signatureBorderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 2,
                color: signatureBorderColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            elevation: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  SignatureBodyWidget(
                    signatureController: signatureController,
                  ),
                  IgnorePointer(
                    child: Align(
                      child: _SignatureTextWidget(
                        signatureController: signatureController,
                        signatureHintText: signatureHintText,
                        fontWeight: FontWeight.w400,
                        color: cSignatureHintTextColor,
                      ),
                    ),
                  ),
                  _SignatureButtonWidget(
                    signatureController: signatureController,
                    signatureButtonHeight: signatureButtonHeight,
                    signatureButtonPadding: signatureButtonPadding,
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

class _SignatureTextWidget extends StatelessWidget {
  const _SignatureTextWidget({
    required this.signatureController,
    required this.signatureHintText,
    required this.fontWeight,
    required this.color,
  });

  final SignatureController signatureController;
  final String signatureHintText;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SignatureBuilder(
      signatureController: signatureController,
      builder: (context, isEmptySignature) {
        return isEmptySignature
            ? SignatureTextWidget(
          fontWeight: fontWeight,
          signatureText: signatureHintText,
          color: color,
        )
            : const EmptyWidget();
      },
    );
  }
}

class _SignatureButtonWidget extends StatelessWidget {
  const _SignatureButtonWidget({
    required this.signatureController,
    required this.signatureButtonHeight,
    required this.signatureButtonPadding,
  });

  final SignatureController signatureController;
  final double signatureButtonHeight;
  final EdgeInsets signatureButtonPadding;

  @override
  Widget build(BuildContext context) {
    return SignatureButtonWidget(
      signatureController: signatureController,
      height: signatureButtonHeight,
      signatureButtonPadding: signatureButtonPadding,
    );
  }
}
