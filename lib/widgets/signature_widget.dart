import 'package:flutter/material.dart';
import 'package:flutter_signature/widgets/empty.dart';
import 'package:flutter_signature/widgets/signature_builder.dart';
import 'package:flutter_signature/widgets/signature_button.dart';
import 'package:flutter_signature/widgets/signature_text.dart';
import 'package:signature/signature.dart';

typedef OnSignatureIsEmptyChanged = void Function(bool);
typedef SignatureIsFillBuilder = Widget Function(
  BuildContext context,
  bool isFill,
);
typedef OnSignatureStateChanged = void Function(SignatureState);

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({
    super.key,
    required this.controller,
    this.onSignatureStateChanged,
    this.hintText = 'Sign here',
    this.hintTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFFAAAAAA),
      fontSize: 28,
    ),
    this.signatureBorderColor = const Color(0xFF72BFEA),
    this.clearButtonText = 'Clear',
    this.clearButtonHeight = 50,
    this.clearButtonPadding = const EdgeInsets.only(right: 10, top: 10),
    this.clearButtonAspectRatio = 1.4,
    this.clearButtonBorderRadius = 10,
    this.clearButtonTextStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFFFFFF),
    ),
    this.clearButtonBackgroundColor = const Color(0xFFCE0A07),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.height = 150,
    this.borderRadius = 10,
    this.borderWidth = 2,
  });

  final SignatureController controller;
  final String hintText;
  final TextStyle hintTextStyle;
  final double clearButtonHeight;
  final EdgeInsets clearButtonPadding;
  final Color signatureBorderColor;
  final String clearButtonText;
  final double clearButtonAspectRatio;
  final double clearButtonBorderRadius;
  final TextStyle clearButtonTextStyle;
  final Color clearButtonBackgroundColor;
  final Color backgroundColor;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final OnSignatureStateChanged? onSignatureStateChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            width: borderWidth,
            color: signatureBorderColor,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        elevation: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            children: [
              _SignatureBodyWidget(
                controller: controller,
                backgroundColor: backgroundColor,
              ),
              _SignatureTextWidget(
                controller: controller,
                textStyle: hintTextStyle,
                text: hintText,
              ),
              _SignatureButtonWidget(
                controller: controller,
                height: clearButtonHeight,
                padding: clearButtonPadding,
                text: clearButtonText,
                aspectRatio: clearButtonAspectRatio,
                borderRadius: clearButtonBorderRadius,
                textStyle: clearButtonTextStyle,
                backgroundColor: clearButtonBackgroundColor,
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
    required this.controller,
    required this.text,
    required this.textStyle,
  });

  final SignatureController controller;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Align(
        child: SignatureBuilder(
          controller: controller,
          builder: (context, isFill) {
            return !isFill
                ? SignatureTextWidget(
                   text: text,
                    textStyle: textStyle,
                  )
                : const EmptyWidget();
          },
        ),
      ),
    );
  }
}

class _SignatureButtonWidget extends StatelessWidget {
  const _SignatureButtonWidget({
    required this.controller,
    required this.height,
    required this.padding,
    required this.text,
    required this.aspectRatio,
    required this.borderRadius,
    required this.textStyle,
    required this.backgroundColor,
  });

  final SignatureController controller;
  final double height;
  final EdgeInsets padding;
  final String text;
  final double aspectRatio;
  final double borderRadius;
  final TextStyle textStyle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SignatureButtonWidget(
      controller: controller,
      height: height,
      text: text,
      padding: padding,
      aspectRatio: aspectRatio,
      borderRadius: borderRadius,
      textStyle: textStyle,
      backgroundColor: backgroundColor,
    );
  }
}

class _SignatureBodyWidget extends StatelessWidget {
  const _SignatureBodyWidget({
    required this.controller,
    required this.backgroundColor,
  });

  final SignatureController controller;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Signature(
          controller: controller,
          backgroundColor: backgroundColor,
          height: constraints.biggest.height,
          width: constraints.biggest.width,
        );
      },
    );
  }
}
