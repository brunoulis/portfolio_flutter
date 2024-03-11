import 'package:flutter/material.dart';

import 'package:portfolio_flutter/themeprovider.dart';
import 'package:portfolio_flutter/widgets/background_image_head.dart';
import 'package:portfolio_flutter/widgets/others_widgets_head_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.isIos});

  final String title;
  final bool isIos;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLoading = true;
  final PageController controller = PageController();

  customlaunchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }

  final List<String> imgList = [
    'lib/assets/linkedin.png',
    'lib/assets/instagram.png',
    'lib/assets/github.png',
    // Agrega más URLs de imágenes si es necesario
  ];

  Padding _initButtomNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15), // Ajusta el espaciado deseado
      child: Container(
        height: 40,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            generateIconButton(
                'lib/assets/linkedin.png',
                'https://www.linkedin.com/in/bruno-luis-vazquez-pais-881ba6281/',
                customlaunchUrl),
            const SizedBox(width: 10),
            generateIconButton('lib/assets/instagram.png',
                'https://www.instagram.com/brunoulis_/', customlaunchUrl),
            const SizedBox(width: 10),
            generateIconButton('lib/assets/gorjeo.png',
                'https://www.twitter.com/brunoulis/', customlaunchUrl),
            const SizedBox(width: 10),
            generateIconButton('lib/assets/github.png',
                'https://github.com/brunoulis', customlaunchUrl)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        print('Cargando');

        isLoading = false;
      });
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
      body: isLoading
          ? loadingWidget()
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Espacio en la parte superior
                    Stack(
                      children: <Widget>[
                        generateStackedImage(context, 'lib/assets/fondo.jpg'),
                        generateCenterWidget(context, customlaunchUrl,
                            'lib/assets/iconbruno.png', imgList),
                        generatePositioned(context),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    generateText(
                        'Sobre mí',
                        35,
                        Provider.of<ThemeProvider>(context).isDarkMode
                            ? Colors.white
                            : Colors.black,
                        true,
                        false),
                    const SizedBox(height: 20),
                    generateCard(
                      [
                        generateRichText(
                            'Hola, soy Bruno Vazquez. ',
                            '\nApasionado de la programación,\n me defino por ser una persona con ganas de aprender  con una actitud perseverante y resolutiva.\n Buena comunicación, trabajo en equipo y capacidad de resolución de problemas.',
                            20,
                            Provider.of<ThemeProvider>(context).isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
