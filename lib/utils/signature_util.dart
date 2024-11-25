import 'dart:convert';
import 'dart:ui';

import 'package:image/image.dart' as image;
import 'package:signature/signature.dart';

Future<String> signatureBase64String(
    SignatureController signatureController,
    ) async {
  final signature = await signatureController.toImage();
  if (signature == null) {
    throw const SignatureConvertToImageException();
  }

  final pngBytes = await signature.toByteData(format: ImageByteFormat.png);
  if (pngBytes == null) {
    throw const SignatureConvertToByteException();
  }
  final uInt8list = pngBytes.buffer
      .asUint8List(pngBytes.offsetInBytes, pngBytes.lengthInBytes);
  final pngAsUiImage = image.decodeImage(uInt8list);
  if (pngAsUiImage == null) {
    throw const SignatureImageDecodeException();
  }
  final base64 = base64Encode(image.encodePng(pngAsUiImage));
  const prefixText = 'data:image/png;base64,';
  return prefixText + base64;
}


abstract class SignatureException implements Exception {
  const SignatureException();
}

class SignatureConvertToImageException extends SignatureException {
  const SignatureConvertToImageException();
}

class SignatureConvertToByteException extends SignatureConvertToImageException {
  const SignatureConvertToByteException();
}

class SignatureImageDecodeException extends SignatureConvertToByteException {
  const SignatureImageDecodeException();
}
