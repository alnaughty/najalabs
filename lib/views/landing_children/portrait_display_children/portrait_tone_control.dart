import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/helpers/landing_ui_helper.dart';

class PortraitToneControl extends StatefulWidget {
  const PortraitToneControl({super.key});

  @override
  State<PortraitToneControl> createState() => _PortraitToneControlState();
}

class _PortraitToneControlState extends State<PortraitToneControl>
    with LandingUIHelper {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Tone Control",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            ...tcontent.map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      e.icon,
                      width: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          IntrinsicWidth(
                            child: Text(
                              e.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          LayoutBuilder(builder: (_, c) {
                            return Container(
                              width: c.maxWidth < 420
                                  ? c.maxWidth
                                  : c.maxWidth * .45,
                              height: 30,
                              child: Slider.adaptive(
                                divisions: 3,
                                value: e.level,
                                onChanged: (f) {
                                  e.level = f;
                                  print("LEVEL $f");
                                  if (mounted) setState(() {});
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
