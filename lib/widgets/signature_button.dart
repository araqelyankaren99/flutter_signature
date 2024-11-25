import 'package:check_in/src/presentation/widgets/global/empty_widget.dart';
import 'package:check_in/src/presentation/widgets/global/input/custom_text_font.dart';
import 'package:check_in/src/presentation/widgets/signature/builder.dart';
import 'package:check_in/src/utils/resources/colors.dart';
import 'package:check_in/src/utils/resources/texts.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureButtonWidget extends StatelessWidget {
  const SignatureButtonWidget({
    Key? key,
    required this.signatureController,
    required this.height,
    required this.signatureButtonPadding,
  }) : super(key: key);

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
                        child: AspectRatio(
                          aspectRatio: 1.37,
                          child: ColoredBox(
                            color: cSignatureClearButtonBgColor,
                            child: Center(
                              child: Text(
                                cSignatureClearButtonText,
                                textAlign: TextAlign.center,
                                style: CustomTextFont.textStyle(
                                  textStyle: const TextStyle(
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
