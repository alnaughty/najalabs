import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/views/landing_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme ttheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    final Color accent = Theme.of(context).highlightColor;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              color: accent,
              height: size.height * .5,
            ),
            SizedBox(
              height: size.height * .1,
            ),
            AnimatedTextKit(
              totalRepeatCount: 2,
              animatedTexts: [
                TypewriterAnimatedText(
                  "NAJALABS",
                  textStyle: TextStyle(
                    color: accent,
                    fontSize: ttheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
              onFinished: () async {
                await Future.delayed(
                  const Duration(milliseconds: 1000),
                );
                // ignore: use_build_context_synchronously
                await Navigator.push(
                  context,
                  PageTransition(
                    child: const LandingPage(),
                    type: PageTransitionType.bottomToTop,
                  ),
                );
              },
            ),
            // Text(
            //   "NAJALABS",
            //   style: TextStyle(
            //     fontFamily: "NotoSans",
            //     color: accent,
            //     fontSize: ttheme.displaySmall!.fontSize,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
