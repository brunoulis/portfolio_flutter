import 'package:flutter/material.dart';
import 'package:portfolio_flutter/myHomePage.dart';
import 'package:portfolio_flutter/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Bruno Vazquez',
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme
            .light(), // Aquí puedes definir tu esquema de color claro
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
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
        ), // Aquí puedes definir tu esquema de color oscuro
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
      home: const MyHomePage(title: 'Portfolio Bruno Vazquez'),
    );
  }
}
