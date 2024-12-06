import 'package:flutter/material.dart';
import 'package:flutter_signature/widgets/signature_widget.dart';
import 'package:signature/signature.dart';

class SignatureBuilder extends StatefulWidget {
  const SignatureBuilder({
    super.key,
    required this.builder,
    required this.controller,
    this.onSignatureIsEmptyChange,
  });

  final SignatureIsEmptyBuilder builder;
  final SignatureController controller;
  final OnSignatureIsEmptyChanged? onSignatureIsEmptyChange;

  @override
  State<SignatureBuilder> createState() => _SignatureBuilderState();
}

class _SignatureBuilderState extends State<SignatureBuilder> {
  late bool _isEmptySignature;

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
    _isEmptySignature = widget.controller.isEmpty;
    _addListener();
  }

  void _addListener() {
    widget.controller.addListener(_signatureListener);
  }

  void _removeListener() {
    widget.controller.removeListener(_signatureListener);
  }

  void _signatureListener() {
    final isEmptySignature = widget.controller.isEmpty;
    if(isEmptySignature == _isEmptySignature){
      return;
    }
    _isEmptySignature = isEmptySignature;
    widget.onSignatureIsEmptyChange?.call(isEmptySignature);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      _isEmptySignature,
    );
  }
}
