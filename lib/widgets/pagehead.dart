import 'package:flutter/material.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';

Stack generateStackedImage(BuildContext context) {
  return Stack(
    children: <Widget>[
      generaOutImage(context, 'lib/assets/fondo.jpg',600),
      gerateDegradeImage(context,600),
    ],
  );
}

Container gerateDegradeImage(BuildContext context,double heightImage){
  return Container(
        height: heightImage,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              // Si el tema es oscuro, usa el color oscuro. De lo contrario, usa el color claro.
              (Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xFF23272A)
                      : const Color.fromARGB(255, 145, 14, 2))
                  .withAlpha(255),
              (Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xFF23272A)
                      : Colors.white)
                  .withAlpha(120), // Color intermedio con menos opacidad
              (Provider.of<ThemeProvider>(context).isDarkMode
                      ? const Color(0xFF191B1D)
                      : Colors.white)
                  .withAlpha(255),
            ],
          ),
        ),
      );
}

SizedBox generaOutImage(BuildContext context, String imageUbi,double heightImage) {
  return SizedBox(
    height: heightImage,
    width: double.infinity,
    child: Image.asset(
      imageUbi,
      fit: BoxFit.cover,
    ),
  );
}
