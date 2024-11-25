import 'package:flutter/material.dart';

const cSignatureBackgroundColor = Color(0xFFFFFFFF);
const cSignaturePenColor = Color(0xFF000000);
const cSignatureHintTextColor = Color(0xFFAAAAAA);
const cSignatureBorderColor = Color(0xFF72BFEA);
const cSignatureBorderErrorColor = Color(0xFFCE0A07);
const cSignatureClearButtonBgColor = Color(0xFFCE0A07);
const cSignatureClearButtonTextColor = Color(0xFFFFFFFF);

const cPatientSignatureText = 'Patient Signature';
const cSponsorSignatureText = 'Guardian Signature';
const cSignatureClearButtonText = 'Clear';

typedef OnSignatureIsEmptyChanged = void Function(bool);
typedef SignatureIsEmptyBuilder = Widget Function(
    BuildContext context,
    bool isKeyboardVisible,
    );
