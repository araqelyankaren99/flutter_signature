import 'package:flutter/material.dart';
import 'package:flutter_signature/resources/app_colors.dart';
import 'package:flutter_signature/resources/app_texts.dart';
import 'package:flutter_signature/screens/signature_image_screen.dart';
import 'package:flutter_signature/utils/signature_util.dart';
import 'package:flutter_signature/widgets/signature_widget.dart';
import 'package:signature/signature.dart';

enum _SignatureState {
  error , inactive , active
}

extension _SignatureStateExtension on _SignatureState {
  Color getBorderColor() {
    switch(this){
      case _SignatureState.error:
        return AppColors.errorColor;
      case _SignatureState.inactive:
       return AppColors.inactiveColor;
      case _SignatureState.active:
       return AppColors.activeColor;
    }
  }
}

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
 late final SignatureController _controller;
 _SignatureState _signatureState = _SignatureState.inactive;

 @override
  void initState() {
    super.initState();
    _controller = SignatureController()..onDrawEnd = _onDrawEnd..onDrawStart = _onDrawStart;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

 void _onDrawEnd() {
   _signatureState = _SignatureState.inactive;
   setState(() {});
 }

 void _onDrawStart() {
   _signatureState = _SignatureState.active;
   setState(() {});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SignatureWidget(
                signatureBorderColor: _signatureState.getBorderColor(),
                controller: _controller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: _onGetSignature,
                child: const Text(AppTexts.getSignatureText),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onGetSignature() async {
    try {
      if(_controller.isEmpty){
        _signatureState = _SignatureState.error;
        setState(() {});
        return;
      }
      final navigator = Navigator.of(context);
      final base64Signature = await signatureBase64String(_controller);
      navigator.push(
        MaterialPageRoute(
          builder: (_) => SignatureImageScreen(signature: base64Signature),
        ),
      );
    } on Exception catch (_) {}
  }
}
