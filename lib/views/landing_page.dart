import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/providers/ipconfig_provider.dart';
import 'package:najalabs/services/udp_services.dart';
import 'package:najalabs/views/landing_children/configure_connection.dart';
import 'package:najalabs/views/landing_children/landscape_display.dart';
import 'package:najalabs/views/landing_children/portrait_display.dart';
import 'package:najalabs/views/landing_children/volume_control.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage> with UDPServices {
  // static final UDPService _service = UDPService.instance;
  // final EstablishedSocket _socketVM = EstablishedSocket.instance;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _service.listen();
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme ttheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    final Color accent = Theme.of(context).highlightColor;
    final config = ref.watch(ipconfigProvider);
    if (config == null) {
      return const ConnectionConfigPage();
    }
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Hero(
          tag: "appbar-title",
          child: Material(
            color: Colors.transparent,
            child: Text(
              "-50dB",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ttheme.displayMedium!.fontSize!,
                color: accent,
                fontWeight: FontWeight.w600,
                fontFamily: "LCD",
              ),
            ),
          ),
        ),
        leading: Hero(
          tag: "power",
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: IconButton(
              onPressed: () async {
                final int i = await getPowerState(config: config);
                print("POWER STATE : $i");
                await setPowerState(
                  config: config,
                  state: i == 1 ? 0 : 1,
                );
              },
              icon: SvgPicture.asset(
                "assets/icons/power.svg",
                color: accent,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // await Navigator.push(
              //   context,
              //   PageTransition(
              //       child: const SettingsPage(),
              //       type: PageTransitionType.leftToRight),
              // );
            },
            icon: SvgPicture.asset(
              "assets/icons/settings.svg",
              color: accent,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 1,
              width: size.width * .6,
              color: accent,
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (_, c) {
              return OrientationBuilder(builder: (context, orientation) {
                final bool isPortrait = orientation == Orientation.portrait;
                if (isPortrait) {
                  return Row(
                    children: [
                      const Expanded(
                        child: LandingPortraitDisplay(),
                      ),
                      SizedBox(
                        width: 50,
                        height: c.maxHeight,
                        child: const VolumeControl(),
                      )
                    ],
                  );
                }
                final bool showRow = c.maxHeight < 700;
                if (showRow) {
                  return Row(
                    children: [
                      const Expanded(
                        child: LandscapeDisplay(),
                      ),
                      SizedBox(
                        width: 60,
                        height: c.maxHeight,
                        child: const VolumeControl(),
                      )
                    ],
                  );
                }
                return Column(
                  children: [
                    const Expanded(
                      child: LandscapeDisplay(),
                    ),
                    SizedBox(
                      height: 50,
                      width: c.maxWidth,
                      child: const VolumeControl(),
                    )
                  ],
                );
              });
            }),
          ),
        ],
      ),
    );
  }
}
