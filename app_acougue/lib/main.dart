import 'package:app_acougue/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  //initializeDateFormatting('pt_BR').then((_) => runApp(const MyApp()));
  //findSystemLocale().then((_) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Açougue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 46, 21, 0)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
