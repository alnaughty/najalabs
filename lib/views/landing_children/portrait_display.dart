import 'package:flutter/material.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/display_mode.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_equalization.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_microphones.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_music_source.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_tone_control.dart';

class LandingPortraitDisplay extends StatefulWidget {
  const LandingPortraitDisplay({super.key});

  @override
  State<LandingPortraitDisplay> createState() => _LandingPortraitDisplayState();
}

class _LandingPortraitDisplayState extends State<LandingPortraitDisplay> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, c) => const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          PortraitMusicSource(),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          PortraitMicrophones(),
          SizedBox(
            height: 10,
          ),
          PortraitDisplayMode(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
