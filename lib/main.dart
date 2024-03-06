import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter/myhomepage.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//import 'firebase_options.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool isIOS() {
    if (kIsWeb) {
      return false; // O devuelve lo que sea apropiado en tu caso para la web.
    } else if (Platform.isIOS || Platform.isMacOS) {
      return true;
    } else {
      return false;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Bruno Vazquez',
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors
                .black, // Color principal de la aplicación, usado en componentes como AppBar, FloatingActionButton, etc.
            secondary: Colors
                .black, // Color secundario, usado en componentes secundarios y widgets interactivos.
            surface: Color(
                0xFF23272A), // Color de elementos de superficie como Card, Dialog, Drawer, etc.
            background: Colors
                .white, // Color de fondo de los componentes de la interfaz de usuario.
            error: Color(0xFF23272A), // Color utilizado para indicar errores.
            onPrimary: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo primary.
            onSecondary: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo secondary.
            onSurface: Colors
                .black, // Color de un texto o icono cuando se coloca sobre un fondo surface.
            onBackground: Color.fromARGB(255, 224, 224,
                224), // Color de un texto o icono cuando se coloca sobre un fondo background.
            onError: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo error.
            brightness: Brightness
                .light, // Define si el tema es claro u oscuro. En este caso, es Brightness.light, lo que significa que el tema es claro.
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 145, 14, 2),
            foregroundColor: Colors.white,
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ), 
            */
          ),
          // Thema para los icon buttons
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 145, 14, 2),
              foregroundColor: Colors.white // Cambia el color a tu preferencia
              ),
          iconButtonTheme: const IconButtonThemeData(
              style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
              Color.fromARGB(255, 145, 14, 2),
            ),
          )
              // Cambia el color a tu preferencia
              )),
      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: Colors
                .white, // Color principal de la aplicación, usado en componentes como AppBar, FloatingActionButton, etc.
            secondary: Colors
                .white, // Color secundario, usado en componentes secundarios y widgets interactivos.
            surface: Color(
                0xFF23272A), // Color de elementos de superficie como Card, Dialog, Drawer, etc.
            background: Color.fromARGB(255, 25, 27,
                29), // Color de fondo de los componentes de la interfaz de usuario.
            error: Color(0xFF23272A), // Color utilizado para indicar errores.
            onPrimary: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo primary.
            onSecondary: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo secondary.
            onSurface: Colors
                .white, // Color de un texto o icono cuando se coloca sobre un fondo surface.
            onBackground: Color.fromARGB(255, 224, 224,
                224), // Color de un texto o icono cuando se coloca sobre un fondo background.
            onError: Color(
                0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo error.
            brightness: Brightness
                .dark, // Define si el tema es claro u oscuro. En este caso, es Brightness.light, lo que significa que el tema es claro.
          ),
          appBarTheme: const AppBarTheme(
            // backgroundColor: Colors.black,
            foregroundColor: Color.fromARGB(255, 226, 205, 10),
            // Cambia el color a tu prefer // Cambia el color a tu preferencia
          ),
          iconTheme: const IconThemeData(
            color: Colors.black, // Cambia el color a tu preferencia
          ),
          sliderTheme: const SliderThemeData(
            activeTrackColor: Color.fromARGB(
                255, 226, 205, 10), // Cambia el color a tu preferencia
            thumbColor: Colors.white, // Cambia el color a tu preferencia
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 226, 205, 10),
            foregroundColor: Colors.black, // Cambia el color a tu preferencia
          ),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 226, 205, 10)),
            ),
            // Cambia el color a tu preferencia
          )
          
         
          // Thema para los icon buttons
          ),
      /* theme: ThemeData(
        useMaterial3: true,
        
        colorScheme: const ColorScheme(
          primary: Colors.white, // Color principal de la aplicación, usado en componentes como AppBar, FloatingActionButton, etc.
          secondary: Colors.white, // Color secundario, usado en componentes secundarios y widgets interactivos.
          surface: Color(0xFF23272A), // Color de elementos de superficie como Card, Dialog, Drawer, etc.
          background: Color.fromARGB(255, 25, 27, 29), // Color de fondo de los componentes de la interfaz de usuario.
          error: Color(0xFF23272A), // Color utilizado para indicar errores.
          onPrimary: Color(0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo primary.
          onSecondary: Color(0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo secondary.
          onSurface: Colors.white, // Color de un texto o icono cuando se coloca sobre un fondo surface.
          onBackground: Color.fromARGB(255, 224, 224, 224), // Color de un texto o icono cuando se coloca sobre un fondo background.
          onError: Color(0xFF23272A), // Color de un texto o icono cuando se coloca sobre un fondo error.
          brightness: Brightness.dark, // Define si el tema es claro u oscuro. En este caso, es Brightness.light, lo que significa que el tema es claro.
        ),
      ),
      */
      home: MyHomePage(title: 'Bruno', isIos: isIOS()),
    );
  }
}
