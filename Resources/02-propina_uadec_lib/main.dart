import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Calculadora de propinas'),
        ),
        body: Container(
        color: Colors.black12,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Cuenta',
                hintText: 'Ingrese el total de la cuenta',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Propinas',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$0.00',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$0.00',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Porcentaje de propinas',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '50%',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Slider(
              value: 0.15,
              min: 0,
              max: 0.3,
              divisions: 6,
              label: '15%',
              onChanged: (double value) {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('15%'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text('20%'),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Redondear Bajo'),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text('Redondear Alto'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
