import 'package:flutter/material.dart';
import 'package:portfolio_flutter/myHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Bruno Vazquez',
      theme: ThemeData(
        useMaterial3: true,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // #23272a
        colorScheme:const ColorScheme(
  primary: Color(0xFF23272A),
  
  secondary: Colors.white,
  
  surface: Color(0xFF23272A),
  background: Colors.white,
  error: Color(0xFF23272A),
  onPrimary: Color(0xFF23272A),
  onSecondary:Colors.white,
  onSurface: Color(0xFF23272A),
  onBackground: Colors.white,
  onError: Color(0xFF23272A),
  brightness: Brightness.light,
  
),
      ),
      home: const MyHomePage(title: 'Portfolio Bruno Vazquez'),
    );
  }
}
