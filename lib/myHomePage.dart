import 'package:flutter/material.dart';

import 'package:portfolio_flutter/themeprovider.dart';
import 'package:portfolio_flutter/widgets/background_image_head.dart';
import 'package:portfolio_flutter/widgets/others_widgets_head_page.dart';
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
                  generateCenterWidget(context, customlaunchUrl),
                ],
              ),
              const SizedBox(height: 20), // Espacio después de la imagen
              // Aquí puedes seguir añadiendo más widgets que quieras mostrar en tu página de portfolio.
              const Wrap(
                children: [
                  Text(
                    '¡Hola! Soy Bruno Vazquez, desarrollador de aplicaciones móviles y web. \nMe encanta aprender cosas nuevas y compartir mis conocimientos con los demás.\n Si tienes alguna pregunta, no dudes en contactarme.',
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
