import 'package:flutter/material.dart';
import 'package:propina_uadec_2/page/propina_estandar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Propina Estándar',
      debugShowCheckedModeBanner: false,
      
      home: PropinaEstandar(),
    );
  }
}
