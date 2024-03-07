import 'package:flutter/material.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';





Stack generateStackedImage(BuildContext context,String imageUbi) {
  return Stack(
    children: <Widget>[
      generaOutImage(context, imageUbi, 700),
      gerateDegradeImage(context, 700),
    ],
  );
}

Container gerateDegradeImage(BuildContext context, double heightImage) {
  return Container(
    height: heightImage,
    width: double.infinity,
    decoration: generateBoxDecoration(context,255,5,255),
  );
}

BoxDecoration generateBoxDecoration(BuildContext context,int gradient1, int gradient2, int gradient3) {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        // Si el tema es oscuro, usa el color oscuro. De lo contrario, usa el color claro.
        (Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xFF23272A)
                : const Color.fromARGB(255, 145, 14, 2))
            .withAlpha(gradient1),
        (Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xFF23272A)
                : Colors.white)
            .withAlpha(gradient2), // Color intermedio con menos opacidad
        (Provider.of<ThemeProvider>(context).isDarkMode
                ? const Color(0xFF191B1D)
                : Colors.white)
            .withAlpha(gradient3),
      ],
    ),
  );
}

SizedBox generaOutImage(
    BuildContext context, String imageUbi, double heightImage) {
  return SizedBox(
    height: heightImage,
    width: double.infinity,
    child: Image.asset(
      imageUbi,
      fit: BoxFit.cover,
    ),
  );
}
