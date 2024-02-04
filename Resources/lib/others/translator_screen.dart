import 'package:flutter/material.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  String __inputNumber = '';
  String _translatedNumber = '';

  void _translateNumber() {
    String numericString = __inputNumber
        .toUpperCase()
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      String? group = match.group(0);
      if (group != null) {
        return _letterToNumber(group);
      } else {
        return '';
      }
    });
    setState(() {
      _translatedNumber = numericString;
    });
  }

  String _letterToNumber(String letter) {
    const Map<String, String> letterToNumberMap = {
      'A': '2', 'B': '2', 'C': '2',
      'D': '3', 'E': '3', 'F': '3',
      'G': '4', 'H': '4', 'I': '4',
      'J': '5', 'K': '5', 'L': '5',
      'M': '6', 'N': '6', 'O': '6',
      'P': '7', 'Q': '7', 'R': '7', 'S': '7',
      'T': '8', 'U': '8', 'V': '8',
      'W': '9', 'X': '9', 'Y': '9', 'Z': '9',
    };
    return letterToNumberMap[letter] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traductor de Números Telefónicos'),
      ),
      body: Column (
        children: <Widget> [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Introduce el número (ejemplo: 555-GET-FOOD)'
            ),
            onChanged: (value) => {
              __inputNumber = value
            },
          ),
          ElevatedButton(
            onPressed: _translateNumber, 
            child: const Text('Traducir')
          ),
          Text(
            _translatedNumber,
            style: const TextStyle(
              fontSize: 20
            ),
          )
        ],
      )
    );
  }
}