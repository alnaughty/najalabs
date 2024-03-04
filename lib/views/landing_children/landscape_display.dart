import 'package:flutter/material.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/display_mode.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_microphones.dart';
import 'package:najalabs/views/landing_children/portrait_display_children/portrait_music_source.dart';

class LandscapeDisplay extends StatefulWidget {
  const LandscapeDisplay({super.key});

  @override
  State<LandscapeDisplay> createState() => _LandscapeDisplayState();
}

class _LandscapeDisplayState extends State<LandscapeDisplay> {
  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).highlightColor;
    // final Color focus = Theme.of(context).highlightColor;
    return LayoutBuilder(
      builder: (context, c) => Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: PortraitMusicSource(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 1,
                  height: c.maxHeight * .9,
                  color: accent,
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    PortraitMicrophones(),
                    SizedBox(
                      height: 5,
                    ),
                    PortraitDisplayMode(),
                  ],
                ),
              ),
              // PortraitMusicSource(),

              // const SizedBox(
              //   height: 10,
              // ),
              // const PortraitMicrophones(),
              // const SizedBox(
              //   height: 10,
              // ),
              // const PortraitDisplayMode(),
              // const SizedBox(
              //   height: 10,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
