import 'package:flutter/material.dart';

class PropinaEstandar extends StatefulWidget {
  const PropinaEstandar({super.key});

  @override
  State<PropinaEstandar> createState() => _PropinaEstandarState();
}

class _PropinaEstandarState extends State<PropinaEstandar> {

  double _fuente = 20; // Variable para el tamaño de la fuente

  ThemeData _temaData = ThemeData.light(); // Variable para el tema

  void _setTemaClaro() {
    setState(() {
      _temaData = ThemeData.light(); // Define el tema claro
    });
  }

  void _setTemaOscuro() {
    setState(() {
      _temaData = ThemeData.dark(); // Define el tema oscuro
    });
  }
  
  void _incrementarFuente() {
    setState(() {
      _fuente ++;
    });
  }

  void _decrementarFuente() {
    setState(() {
      _fuente --;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Propina Estándar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.blue[900],
      ),
      body: _Propina(fuente: _fuente),
      floatingActionButton: _Lux(
        temaClaro: _setTemaClaro,
        temaOscuro: _setTemaOscuro,
      ),
      bottomNavigationBar: _Bottom(
        incrementarFuente: _incrementarFuente,
        decrementarFuente: _decrementarFuente,
      ),
    );
  }
}

class _Propina extends StatefulWidget {
  final double fuente;

  const _Propina({required this.fuente});

  @override
  State<_Propina> createState() => _PropinaState();
}

class _PropinaState extends State<_Propina> {

  double valore = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Factura: ',
                  style: textoEstilo(),
                ),
                const Spacer(),
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Total de la factura',
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Propina: ',
                  style: textoEstilo(),
                ),
                const Spacer(),
                Text(
                  '\$31.00',
                  style: textoEstilo(),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Total: ',
                  style: textoEstilo(),
                ),
                const Spacer(),
                Text(
                  '\$331.00',
                  style: textoEstilo(),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Porcentaje de propina: ',
                  style: textoEstilo(),
                ),
                const Spacer(),
                Text(
                  '$valore %',
                  style: textoEstilo(),
                ),
              ],
            ),
            Slider(
              min: 0,
              max: 100,
              value: valore,
              activeColor: Colors.blue,
              onChanged: (double newValue) {
                setState(() {
                  valore = newValue.roundToDouble();
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), 
                  child: const Text('15%'),
                  onPressed: () {
                    setState(() {
                      valore = 15;
                    });
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), 
                  child: const Text('20%'),
                  onPressed: () {
                    setState(() {
                      valore = 20;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), 
                  onPressed: () {},
                  child: const Text('Redondear alto'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ), 
                  onPressed: () {},
                  child: const Text('Redondear bajo'),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }

  TextStyle textoEstilo() {
    return TextStyle(
      fontSize: widget.fuente,
      fontWeight: FontWeight.w400,
    );
  }
}

class _Lux extends StatelessWidget {

  final VoidCallback temaClaro;
  final VoidCallback temaOscuro;

  const _Lux({
    required this.temaClaro,
    required this.temaOscuro,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: temaClaro,
          child: const Text("Claro"),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: temaOscuro,
          child: const Text("Oscuro"),
        ),
      ],
    );
  }
}

class _Bottom extends StatelessWidget {

  final VoidCallback incrementarFuente;
  final VoidCallback decrementarFuente;


  const _Bottom({
    required this.incrementarFuente,
    required this.decrementarFuente,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.add),
            onPressed: incrementarFuente,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            color: Colors.white,
            onPressed: decrementarFuente,
          ),
        ],
      ),
    );
  }
}