import 'package:flutter/material.dart';
import 'package:flutter_signature/widgets/empty.dart';
import 'package:flutter_signature/widgets/signature_builder.dart';
import 'package:signature/signature.dart';

class SignatureButtonWidget extends StatelessWidget {
  const SignatureButtonWidget({
    super.key,
    required this.controller,
    required this.height,
    required this.text,
    required this.padding,
    required this.aspectRatio,
    required this.borderRadius,
    required this.textStyle,
    required this.backgroundColor,
  });

  final SignatureController controller;
  final double height;
  final String text;
  final EdgeInsets padding;
  final double aspectRatio;
  final double borderRadius;
  final TextStyle textStyle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SignatureBuilder(
      controller: controller,
      builder: (context, isEmptySignature) {
        return !isEmptySignature
            ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: padding,
                  child: GestureDetector(
                    onTap: _clearSignature,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: SizedBox(
                        height: height,
                        child:  AspectRatio(
                          aspectRatio: aspectRatio,
                          child: ColoredBox(
                            color: backgroundColor,
                            child: Center(
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                                style: textStyle,
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
    controller.clear();
  }
}
