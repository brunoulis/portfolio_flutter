import 'package:flutter/material.dart';

import 'package:portfolio_flutter/themeprovider.dart';
import 'package:portfolio_flutter/widgets/pagehead.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.isIos});

  final String title;
  final bool isIos;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  customlaunchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'No se pudo lanzar $url';
    }
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
              // Espacio en la parte superior
              Stack(
                children: <Widget>[
                  generateStackedImage(context),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                            height:
                                1), // Espacio entre el borde y el CircleAvatar
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('lib/assets/iconbruno.png'),
                        ),
                        const SizedBox(height: 10),
                        // Espacio entre el CircleAvatar y el texto
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bruno Vazquez',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Técnico Superior en Desarrollo de aplicaciones multiplataforma - Técnico de sistemas Microinformaticos',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Card(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: () async {
                                  // Add your onPressed code here!
                                  // Por ejemplo, puedes abrir un enlace a tu perfil de LinkedIn.
                                  const url =
                                      'https://www.linkedin.com/in/bruno-luis-vazquez-pais-881ba6281/';
                                  await customlaunchUrl(url);
                                },
                                icon: const ImageIcon(
                                    AssetImage('lib/assets/linkedin.png')),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () async {
                                  const url =
                                      'https://www.instagram.com/brunoulis_/';
                                  await customlaunchUrl(url);
                                  // Add your onPressed code here!
                                },
                                icon: const ImageIcon(
                                    AssetImage('lib/assets/instagram.png')),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () async {
                                  const url =
                                      'https://www.twitter.com/brunoulis/';
                                  await customlaunchUrl(url);
                                  // Add your onPressed code here!
                                },
                                icon: const ImageIcon(
                                    AssetImage('lib/assets/gorjeo.png')),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () async {
                                  const url = 'https://github.com/brunoulis';
                                  await customlaunchUrl(url);
                                },
                                icon: const ImageIcon(
                                    AssetImage('lib/assets/github.png')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Espacio después de la imagen
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
