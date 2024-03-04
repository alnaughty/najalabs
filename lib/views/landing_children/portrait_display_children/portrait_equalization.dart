import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/helpers/landing_ui_helper.dart';

class PortraitEqualization extends StatefulWidget {
  const PortraitEqualization({super.key});

  @override
  State<PortraitEqualization> createState() => _PortraitEqualizationState();
}

class _PortraitEqualizationState extends State<PortraitEqualization>
    with LandingUIHelper {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Equalization",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            ...eqcontent.map(
              (e) => ListTile(
                leading: SvgPicture.asset(
                  e.icon,
                  width: 20,
                  color: Colors.white,
                ),
                title: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.start,
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
                    Switch.adaptive(
                      value: e.isActive,
                      onChanged: (onChanged) {
                        e.isActive = onChanged;
                        if (mounted) setState(() {});
                      },
                    ),
                  ],
                ),
                // trailing:
                // title:
              ),
            )
          ],
        )
      ],
    );
  }
}
