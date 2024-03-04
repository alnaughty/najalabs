import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najalabs/models/ip_et_port.dart';
import 'package:najalabs/providers/ipconfig_provider.dart';
import 'package:najalabs/src/ip_text_formatter.dart';
import 'package:najalabs/src/str_ext.dart';

class ConnectionConfigPage extends ConsumerStatefulWidget {
  const ConnectionConfigPage({super.key});

  @override
  ConsumerState<ConnectionConfigPage> createState() =>
      _ConnectionConfigPageState();
}

class _ConnectionConfigPageState extends ConsumerState<ConnectionConfigPage> {
  late final TextEditingController ipConfig;
  final GlobalKey<FormState> _kForms = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ipConfig = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ipConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme ttheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    final Color accent = Theme.of(context).highlightColor;
    final Color focus = Theme.of(context).focusColor;
    // final List<TextInputFormatter> _inputFormatters = ;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  // totalRepeatCount: 2,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Bienvenue chez".toUpperCase(),
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        color: accent,
                        fontSize: ttheme.displaySmall?.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TypewriterAnimatedText(
                      "NAJALABS",
                      textStyle: TextStyle(
                        color: accent,
                        fontSize: ttheme.displaySmall?.fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  "assets/images/logo.svg",
                  color: accent,
                  height: size.height * .3,
                ),
                Text(
                  "Configurer la connexion",
                  style: TextStyle(
                    color: accent,
                  ),
                ),
                Form(
                  key: _kForms,
                  child: TextFormField(
                    maxLength: 15,
                    controller: ipConfig,
                    undoController: UndoHistoryController(),
                    keyboardType: TextInputType.number,
                    cursorColor: accent,
                    inputFormatters: [
                      // FilteringTextInputFormatter.digitsOnly,
                      IpTextInputFormatter()
                    ],
                    validator: (t) {
                      if (t == null) {
                        return "Une erreur s'est produite lors de l'initialisation du champ";
                      } else if (t.isEmpty) {
                        return "Ce champ est requis";
                      } else if (!t.isValidIPv4) {
                        return "Format IP invalide";
                      }
                      return null;
                    },
                    onEditingComplete: () {
                      final bool isValid = _kForms.currentState!.validate();
                      if (isValid) {
                        print("GO");
                        if (mounted) setState(() {});
                      }
                    },
                    style: TextStyle(
                      color: accent,
                    ),
                    decoration: InputDecoration(
                      hintText: "IP Address",
                      hintStyle: TextStyle(
                        color: accent.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    final bool isValid = _kForms.currentState!.validate();
                    if (isValid) {
                      // print("GO");
                      ref.watch(ipconfigProvider.notifier).update(
                            (state) => IPetPort(
                              ip: ipConfig.text,
                            ),
                          );
                      if (mounted) setState(() {});
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Soumettre",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
