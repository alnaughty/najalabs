import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:najalabs/providers/theme_mode_provider.dart';
import 'package:najalabs/views/splash_screen.dart';

class NajaLabs extends StatelessWidget {
  const NajaLabs({super.key});
  static final MaterialColor materialColor = MaterialColor(
    0xFF2BAD68,
    {
      50: const Color(0xFF2BAD68).withOpacity(.1),
      100: const Color(0xFF2BAD68).withOpacity(.2),
      200: const Color(0xFF2BAD68).withOpacity(.3),
      300: const Color(0xFF2BAD68).withOpacity(.4),
      400: const Color(0xFF2BAD68).withOpacity(.5),
      500: const Color(0xFF2BAD68).withOpacity(.6),
      600: const Color(0xFF2BAD68).withOpacity(.7),
      700: const Color(0xFF2BAD68).withOpacity(.8),
      800: const Color(0xFF2BAD68).withOpacity(.9),
      900: const Color(0xFF2BAD68),
    },
  );
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        var darkMode = ref.watch(darkModeProvider);
        return MaterialApp(
          // darkTheme: ThemeData.dark(useMaterial3: true).copyWith(),
          darkTheme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xFF2BAD68),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: materialColor,
            ),
            fontFamily: "Graphik",
            scaffoldBackgroundColor: Colors.grey.shade900,
            highlightColor: Colors.white,
            focusColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade900,
            ),
          ),

          title: 'Naja Labs',
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xFF2BAD68),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: materialColor,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade100,
            ),
            scaffoldBackgroundColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade800,
            focusColor: materialColor,
            primarySwatch: materialColor,
            fontFamily: "Graphik",
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
