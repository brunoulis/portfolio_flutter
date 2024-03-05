import 'package:flutter/material.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.isIos});

  final String title;
  final bool isIos;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          /*IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),*/
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.brightness_4
                  : Icons.brightness_high,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20), // Espacio en la parte superior
              Container(
                width: 200, // Ajusta el tamaño según tus necesidades
                height: 200, // Ajusta el tamaño según tus necesidades
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'ruta_a_tu_imagen_de_fondo_en_assets'), // Cambia esto por la ruta de tu imagen de fondo en los assets
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                      'ruta_a_tu_imagen_en_assets'), // Cambia esto por la ruta de tu imagen en los assets
                ),
              ),
              const SizedBox(height: 20), // Espacio después de la imagen
              const Text(
                'Bruno Vazquez',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Espacio después del nombre
              // Aquí puedes seguir añadiendo más widgets que quieras mostrar en tu página de portfolio.
              const Wrap(
                children: [
                  Text(
                    '¡Hola! Soy Bruno Vazquez, desarrollador de aplicaciones móviles y web. Me encanta aprender cosas nuevas y compartir mis conocimientos con los demás. Si tienes alguna pregunta, no dudes en contactarme.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
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
