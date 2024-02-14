import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


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

  void _makePhoneCall(String number) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: number.replaceAll('-', ''), // Elimina los guiones si están presentes
  );
  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    throw 'No se pudo lanzar ${launchUri.toString()}';
  }
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
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        title: const Text('Traductor de Números Telefónicos'),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Introduce un número telefónico para traducirlo a números',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Introduce el número (ejemplo: 555-GET-FOOD)'
            ),
            onChanged: (value) => {
              __inputNumber = value
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
            ),
            onPressed: _translateNumber, 
            child: const Text('Traducir')
          ),
          Text(
            _translatedNumber,
            style: const TextStyle(
              fontSize: 20
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
            ),
            onPressed: () => _makePhoneCall(_translatedNumber),
            child: const Text('Llamar')
          )
        ],
      )
    );
  }
}
