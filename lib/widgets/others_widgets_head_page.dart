import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';

Center generateCenterWidget(BuildContext context, Function customlaunchUrl,
    String imageUbi, List<String> imgList) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 1), // Espacio entre el borde y el CircleAvatar
        generateCircleAvatar(imageUbi, context),
        const SizedBox(height: 10),
        // Espacio entre el CircleAvatar y el texto
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                100), // Esto redondea los bordes del Container y su sombra
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              generateText('Bruno Vazquez', 30, Colors.white),
              generateRichText(
                "Hola, soy Bruno Vazquez.",
                "Apasionado de la programación,\n me defino por ser una persona con ganas de aprender y con una actitud perseverante y resolutiva.\n Buena comunicación, trabajo en equipo y capacidad de resolución de problemas.",
                16,
                Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom:
                      10.0), // Ajusta este valor para cambiar el relleno inferior
              child: Align(
                alignment: Alignment.center,
                child: generateText("Proyectos:", 20, Colors.white),
              ),
            ),
            SizedBox(
              height: 300, // Ajusta este valor según tus necesidades
              width: MediaQuery.of(context)
                  .size
                  .width, // Ajusta este valor según tus necesidades
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: imgList.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width *
                            0.5, // Ajusta este valor para cambiar el ancho del Container
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.scaleDown,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Center loadingWidget() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 145, 14, 2)),
    ),
  );
}

SelectableText generateText(String textfield, double size, Color? color) {
  return SelectableText(
    textfield,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}

IconButton generateIconButton(
    String imageUbi, String url, Function customlaunchUrl) {
  return IconButton(
    onPressed: () async {
      await customlaunchUrl(url);
    },
    icon: ImageIcon(AssetImage(imageUbi)),
  );
}

SelectableText generateRichText(
    String textfield1, String textfield2, double size, Color? color) {
  return SelectableText.rich(
    TextSpan(
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
      children: <TextSpan>[
        TextSpan(
          text: textfield1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: textfield2,
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

//Pie de cabecera para poner el logo de flutter
Positioned generatePositioned(BuildContext context) {
  return Positioned(
    bottom: 10,
    right: 10,
    child: Row(
      children: <Widget>[
        generateText(
          'This design was created by brunoulis using ',
          8,
          Provider.of<ThemeProvider>(context).isDarkMode
              ? Colors.white
              : Colors.black,
        ),
        const FlutterLogo(size: 12),
      ],
    ),
  );
}

CircleAvatar generateCircleAvatar(String imageUbi, BuildContext context) {
  return CircleAvatar(
    radius: 100,
    backgroundImage: AssetImage(imageUbi),
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Provider.of<ThemeProvider>(context).isDarkMode
              ? const Color.fromARGB(255, 226, 205, 10)
              : const Color.fromARGB(255, 145, 14, 2),
          width: 4,
        ),
        shape: BoxShape.circle,
      ),
    ),
  );
}
