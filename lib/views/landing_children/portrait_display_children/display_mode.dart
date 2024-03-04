import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/providers/theme_mode_provider.dart';

class PortraitDisplayMode extends ConsumerStatefulWidget {
  const PortraitDisplayMode({super.key});

  @override
  ConsumerState<PortraitDisplayMode> createState() =>
      _PortraitDisplayModeState();
}

class _PortraitDisplayModeState extends ConsumerState<PortraitDisplayMode> {
  @override
  Widget build(BuildContext context) {
    // final Brightness brightness = MediaQuery.of(context).platformBrightness;
    // final bool isDarkMode = brightness == Brightness.dark;
    final isDarkmode = ref.watch(darkModeProvider);
    final Color accent = Theme.of(context).highlightColor;
    return Column(
      children: [
        Text(
          "Display",
          style: TextStyle(
            color: accent,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        ListTile(
          title: Text(
            "Dark Mode",
            style: TextStyle(
              color: accent,
            ),
          ),
          leading: SvgPicture.asset(
            "assets/icons/darkmode.svg",
            width: 20,
            color: accent,
          ),
          trailing: Switch.adaptive(
            inactiveTrackColor: Colors.grey.shade300,
            value: isDarkmode,
            onChanged: (onChanged) {
              ref.read(darkModeProvider.notifier).toggle();
              // if (isDarkmode) {
              // }
              // e.isActive = onChanged;
              if (mounted) setState(() {});
            },
          ),
        )
      ],
    );
  }
}
