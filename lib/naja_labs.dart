import 'package:flutter/material.dart';
import 'package:najalabs/splash_screen.dart';

class NajaLabs extends StatelessWidget {
  const NajaLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 9, 168, 30),
        primarySwatch: const MaterialColor(
          0xff870E4E,
          {
            50: Color.fromRGBO(136, 14, 79, .1),
            100: Color.fromRGBO(136, 14, 79, .2),
            200: Color.fromRGBO(136, 14, 79, .3),
            300: Color.fromRGBO(136, 14, 79, .4),
            400: Color.fromRGBO(136, 14, 79, .5),
            500: Color.fromRGBO(136, 14, 79, .6),
            600: Color.fromRGBO(136, 14, 79, .7),
            700: Color.fromRGBO(136, 14, 79, .8),
            800: Color.fromRGBO(136, 14, 79, .9),
            900: Color.fromRGBO(136, 14, 79, 1),
          },
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
