import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/providers/ipconfig_provider.dart';
import 'package:najalabs/providers/volume_provider.dart';
import 'package:najalabs/services/udp_services.dart';

class VolumeControl extends ConsumerStatefulWidget {
  const VolumeControl({super.key});

  @override
  ConsumerState<VolumeControl> createState() => _VolumeControlState();
}

class _VolumeControlState extends ConsumerState<VolumeControl>
    with UDPServices {
  // late
  @override
  Widget build(BuildContext context) {
    final Color accent = Theme.of(context).highlightColor;
    final Color focus = Theme.of(context).focusColor;
    final double currentVal = ref.watch(volumeProvider.notifier).state;
    final Widget btn = IconButton(
      onPressed: () async {
        if (currentVal >= 0.5) {
          ref.watch(volumeProvider.notifier).state = 0.0;
          await mute(config: ref.watch(ipconfigProvider)!);
        } else {
          ref.watch(volumeProvider.notifier).state = 1.0;
          await unmute(config: ref.watch(ipconfigProvider)!);
        }
        if (mounted) setState(() {});
      },
      icon: SvgPicture.asset(
        "assets/icons/${currentVal == 0 ? "mute" : currentVal <= 0.5 ? "volume-down" : "volume"}.svg",
        // color: Colors.white,
        colorFilter: ColorFilter.mode(
            currentVal == 0 ? accent.withOpacity(.5) : focus, BlendMode.srcIn),
        width: 25,
      ),
    );
    final slider = Slider.adaptive(
      divisions: 4,
      value: currentVal,
      inactiveColor: Colors.grey.shade400,
      activeColor: focus,
      onChanged: (f) {
        ref.watch(volumeProvider.notifier).state = f;
      },
    );
    final addBtn = IconButton(
      onPressed: () {
        final double currentVal = ref.watch(volumeProvider.notifier).state;
        if (currentVal < 1.0) {
          ref.watch(volumeProvider.notifier).state += .25;
          if (mounted) setState(() {});
        }
      },
      icon: SvgPicture.asset(
        "assets/icons/plus.svg",
        color: accent,
        width: 25,
      ),
    );
    final minusBtn = IconButton(
      onPressed: () {
        final double currentVal = ref.watch(volumeProvider.notifier).state;
        if (currentVal > 0.0) {
          ref.watch(volumeProvider.notifier).state -= .25;
          if (mounted) setState(() {});
        }
      },
      icon: SvgPicture.asset(
        "assets/icons/minus.svg",
        color: accent,
        width: 25,
      ),
    );
    return LayoutBuilder(builder: (context, c) {
      final bool showPortrait = c.maxWidth < c.maxHeight;
      if (showPortrait) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  addBtn,
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: slider,
                    ),
                  ),
                  minusBtn,
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            btn,
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }
      return Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              children: [
                minusBtn,
                Expanded(child: slider),
                addBtn,
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          btn,
          const SizedBox(
            width: 10,
          ),
        ],
      );
    });
  }
}
