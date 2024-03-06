import 'package:flutter/material.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';

Center generateCenterWidget(BuildContext context, Function customlaunchUrl) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 1), // Espacio entre el borde y el CircleAvatar
        generateCircleAvatar('lib/assets/iconbruno.png'),
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
              IconButton(
                onPressed: () async {
                  // Add your onPressed code here!
                  // Por ejemplo, puedes abrir un enlace a tu perfil de LinkedIn.
                  const url =
                      'https://www.linkedin.com/in/bruno-luis-vazquez-pais-881ba6281/';
                  await customlaunchUrl(url);
                },
                icon: const ImageIcon(AssetImage('lib/assets/linkedin.png')),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () async {
                  const url = 'https://www.instagram.com/brunoulis_/';
                  await customlaunchUrl(url);
                  // Add your onPressed code here!
                },
                icon: const ImageIcon(AssetImage('lib/assets/instagram.png')),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () async {
                  const url = 'https://www.twitter.com/brunoulis/';
                  await customlaunchUrl(url);
                  // Add your onPressed code here!
                },
                icon: const ImageIcon(AssetImage('lib/assets/gorjeo.png')),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () async {
                  const url = 'https://github.com/brunoulis';
                  await customlaunchUrl(url);
                },
                icon: const ImageIcon(AssetImage('lib/assets/github.png')),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Text generateText(String textfield, double size, Color? color) {
  return Text(
    textfield,
    style: TextStyle(
      fontSize: size,
      color: color,
    ),
  );
}

RichText generateRichText(
    String textfield1, String textfield2, double size, Color? color) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
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
  );
}

CircleAvatar generateCircleAvatar(String imageUbi) {
  return CircleAvatar(
    radius: 100,
    backgroundImage: AssetImage(imageUbi),
  );
}
