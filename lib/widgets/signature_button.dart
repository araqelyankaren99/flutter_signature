import 'package:flutter/material.dart';
import 'package:flutter_signature/constants.dart';
import 'package:flutter_signature/widgets/empty.dart';
import 'package:flutter_signature/widgets/signature_builder.dart';
import 'package:signature/signature.dart';

class SignatureButtonWidget extends StatelessWidget {
  const SignatureButtonWidget({
    super.key,
    required this.signatureController,
    required this.height,
    required this.signatureButtonPadding,
  });

  final SignatureController signatureController;
  final double height;
  final EdgeInsets signatureButtonPadding;

  @override
  Widget build(BuildContext context) {
    return SignatureBuilder(
      signatureController: signatureController,
      builder: (context, isEmptySignature) {
        return !isEmptySignature
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: signatureButtonPadding,
                  child: GestureDetector(
                    onTap: _clearSignature,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: height,
                        child: const AspectRatio(
                          aspectRatio: 1.37,
                          child: ColoredBox(
                            color: cSignatureClearButtonBgColor,
                            child: Center(
                              child: Text(
                                cSignatureClearButtonText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: cSignatureClearButtonTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const EmptyWidget();
      },
    );
  }

  void _clearSignature() {
    signatureController.clear();
  }
}
