import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:najalabs/naja_labs.dart';
import 'package:najalabs/services/udp_services.dart';

void main() async {
  final UDPService _udpService = UDPService.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setWindowSize(const Size(700, 700));
  await DesktopWindow.setMinWindowSize(const Size(600, 700));
  await _udpService.initialize();
  runApp(const NajaLabs());
}
