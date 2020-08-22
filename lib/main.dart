import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:ui_challenge_4/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = MaskedTextController(mask: '00000-00');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextField(
            controller: controller,
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String formatListToCreditCard() {
    return this.replaceAll('[', '').replaceAll(']', '').replaceAll(',', '');
  }
}
