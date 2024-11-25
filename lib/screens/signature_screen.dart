import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature/screens/signature_image_screen.dart';
import 'package:flutter_signature/utils/signature_util.dart';
import 'package:signature/signature.dart';

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final _signatureController = SignatureController();

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Signature(
              controller: _signatureController,
              width: 200,
              height: 200,
              backgroundColor: const Color(0xFFFFFFFF),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: _onGetSignature,
                child: const Text('Get signature image'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onGetSignature() async {
    try {
      final navigator = Navigator.of(context);
      final base64Signature = await signatureBase64String(_signatureController);
      navigator.push(
        MaterialPageRoute(
          builder: (_) => SignatureImageScreen(signature: base64Signature),
        ),
      );
    } on Exception catch (_) {}
  }
}
