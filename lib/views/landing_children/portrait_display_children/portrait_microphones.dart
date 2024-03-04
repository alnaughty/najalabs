import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/helpers/landing_ui_helper.dart';

class PortraitMicrophones extends StatefulWidget {
  const PortraitMicrophones({super.key});

  @override
  State<PortraitMicrophones> createState() => _PortraitMicrophonesState();
}

class _PortraitMicrophonesState extends State<PortraitMicrophones>
    with LandingUIHelper {
  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).highlightColor;
    final Color focus = Theme.of(context).focusColor;
    return Column(
      children: [
        Text(
          "Microphones",
          style: TextStyle(
            color: accent,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            ...miccontents.map(
              (e) => ListTile(
                leading: SvgPicture.asset(
                  e.icon,
                  width: 20,
                  color: accent,
                ),
                title: Text(
                  e.name,
                  style: TextStyle(
                    color: accent,
                    fontSize: 13,
                  ),
                ),
                subtitle: LayoutBuilder(builder: (context, c) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: FittedBox(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              // final double currentVal =
                              //     ref.watch(volumeProvider.notifier).state;
                              // if (currentVal < 1.0) {
                              //   ref.watch(volumeProvider.notifier).state += .25;
                              //   if (mounted) setState(() {});
                              // }
                              if (e.level > 0.0) {
                                e.level -= .25;
                              }
                              if (mounted) setState(() {});
                            },
                            icon: Center(
                              child: SvgPicture.asset(
                                "assets/icons/minus.svg",
                                color: accent,
                                width: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      Expanded(
                        child: Slider.adaptive(
                          divisions: 4,
                          value: e.level,
                          inactiveColor: Colors.grey.shade400.withOpacity(.5),
                          activeColor: focus,
                          onChanged: (f) {
                            setState(() {
                              e.level = f;
                            });
                            // ref.watch(volumeProvider.notifier).state = f;
                          },
                        ),
                      ),

                      SizedBox(
                        width: 25,
                        height: 25,
                        child: FittedBox(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              // final double currentVal =
                              //     ref.watch(volumeProvider.notifier).state;
                              // if (currentVal < 1.0) {
                              //   ref.watch(volumeProvider.notifier).state += .25;
                              //   if (mounted) setState(() {});
                              // }
                              if (e.level < 1.0) {
                                e.level += .25;
                              }
                              if (mounted) setState(() {});
                            },
                            icon: Center(
                              child: SvgPicture.asset(
                                "assets/icons/plus.svg",
                                color: accent,
                                width: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            )
            // ...micontent.map(
            //   (e) => ListTile(
            //     leading: SvgPicture.asset(
            //       e.icon,
            //       width: 20,
            //       color: accent,
            //     ),
            //     // trailing:
            //     title: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       alignment: WrapAlignment.spaceBetween,
            //       runAlignment: WrapAlignment.start,
            //       runSpacing: 10,
            //       spacing: 10,
            //       children: [
            //         IntrinsicWidth(
            //           child: Text(
            //             e.name,
            //             style:
            //                 const TextStyle(color: accent, fontSize: 13),
            //           ),
            //         ),
            //         Switch.adaptive(
            //           inactiveTrackColor: Colors.grey.shade300,
            //           value: e.isActive,
            //           onChanged: (onChanged) {
            //             e.isActive = onChanged;
            //             if (mounted) setState(() {});
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Wrap(
            //   children: [
            //     ...micontent2.map(
            //       (e) => ListTile(
            //         leading: e.icon.isNotEmpty
            //             ? SvgPicture.asset(
            //                 e.icon,
            //                 width: 20,
            //                 color: accent,
            //               )
            //             : null,
            //         title: Text(
            //           e.name,
            //           style: const TextStyle(
            //             color: accent,
            //             fontSize: 13,
            //           ),
            //         ),
            //         trailing: Switch.adaptive(
            //           value: e.isActive,
            //           inactiveTrackColor: Colors.grey.shade300,
            //           onChanged: (onChanged) {
            //             e.isActive = onChanged;
            //             if (mounted) setState(() {});
            //           },
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        )
      ],
    );
  }
}
