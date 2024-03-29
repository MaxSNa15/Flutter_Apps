import 'package:flutter/material.dart';
import 'others/translator_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traductor de Números Telefónicos',
      home: TranslatorScreen(),
    );
  }
}

