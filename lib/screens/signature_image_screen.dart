import 'dart:convert';
import 'package:flutter/material.dart';

class SignatureImageScreen extends StatelessWidget {
  const SignatureImageScreen({super.key, required this.signature});

  final String signature;

  @override
  Widget build(BuildContext context) {
    final String imageString = signature.split(',').last;

    final imageBytes = base64.decode(imageString);

    return Scaffold(
      body: Center(
        child: Image.memory(
          imageBytes, // Display the image
          fit: BoxFit.contain, // Adjust fit as needed
        ),
      ),
    );
  }
}
