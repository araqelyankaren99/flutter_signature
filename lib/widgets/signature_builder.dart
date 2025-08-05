import 'package:flutter/material.dart';
import 'package:flutter_signature/widgets/signature_widget.dart';
import 'package:signature/signature.dart';

class SignatureBuilder extends StatefulWidget {
  const SignatureBuilder({
    super.key,
    required this.builder,
    required this.controller,
    this.onSignatureIsFillChanged,
  });

  final SignatureIsFillBuilder builder;
  final SignatureController controller;
  final OnSignatureIsFillChanged? onSignatureIsFillChanged;

  @override
  State<SignatureBuilder> createState() => _SignatureBuilderState();
}

class _SignatureBuilderState extends State<SignatureBuilder> {
  late bool _isFillSignature;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  void _initialize() {
    _isFillSignature = widget.controller.isNotEmpty;
    _addListener();
  }

  void _addListener() {
    widget.controller.addListener(_signatureListener);
  }

  void _removeListener() {
    widget.controller.removeListener(_signatureListener);
  }

  void _signatureListener() {
    final isFillSignature = widget.controller.isNotEmpty;
    if(isFillSignature == _isFillSignature){
      return;
    }
    _isFillSignature = isFillSignature;
    widget.onSignatureIsFillChanged?.call(isFillSignature);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _isFillSignature,
    );
  }
}
