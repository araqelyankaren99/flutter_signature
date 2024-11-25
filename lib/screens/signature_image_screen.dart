import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SignatureImageScreen extends StatelessWidget {
  const SignatureImageScreen({super.key,required this.signature});

  final String signature;

  @override
  Widget build(BuildContext context) {
    final String imageString = signature
        .split(',')
        .last;

    Uint8List imageBytes = base64.decode(imageString);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Base64 Image Example'),
        ),
        body: Center(
          child: Image.memory(
            imageBytes, // Display the image
            fit: BoxFit.contain, // Adjust fit as needed
          ),
        ));
  }
}
