import 'dart:convert';
import 'dart:io';

import 'package:najalabs/models/device_datagram_model.dart';
import 'package:najalabs/view_models/device_datagram_vm.dart';

class UDPService {
  UDPService._pr();
  static final UDPService _instance = UDPService._pr();
  static final DeviceDatagramVm _vm = DeviceDatagramVm.instance;
  static UDPService get instance => _instance;
  late final RawDatagramSocket _udpSocket;
  Future<void> initialize() async {
    _udpSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  }

  void sendUDPPacket() {
    final InternetAddress targetIp = InternetAddress('192.168.1.100');
    const targetPort = 12345;

    const String message = 'Your UDP message here';
    _udpSocket.send(message.codeUnits, targetIp, targetPort);
  }

  void listen() {
    _udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        final Datagram? datagram = _udpSocket.receive();
        if (datagram != null) {
          final String response = String.fromCharCodes(datagram.data);
          final Map<String, dynamic> deviceInfo = jsonDecode(response);
          final DeviceDatagramModel model =
              DeviceDatagramModel.fromJson(deviceInfo);
          _vm.append(model);
        }
      }
    });
  }
}
