import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:najalabs/models/ip_et_port.dart';
import 'package:z_udp_handler/z_udp_handler.dart';

mixin class UDPServices {
  final ZUDPHandler _handler = ZUDPHandler();
  Future<void> getRouter(
      {required IPetPort config,
      required ValueChanged<String> onReturn}) async {
    await _handler.send(
      config.ip,
      config.port,
      "Dev.Router.ForceInputPriority?2",
      onDataReceive: onReturn,
    );
  }

  Future<void> getModelName(
      {required IPetPort config,
      required ValueChanged<String> onReturn}) async {
    await _handler.send(
      config.ip,
      6004, // port is set to 6004 for receiving
      "Dev.ModelName?A 1",
      onDataReceive: onReturn,
    );
  }

  Future<void> setPowerState(
      {required IPetPort config, required int state}) async {
    assert(state == 0 || state == 1);
    await _handler.send(
      config.ip,
      config.port,
      "Dev.Power=$state",
    );
    if (state == 0) {
      Fluttertoast.showToast(msg: "Power State : Veille");
    } else {
      Fluttertoast.showToast(msg: "Power State : Allumé");
    }
    return;
  }

  Future<int> getPowerState({required IPetPort config}) async {
    int i = 0;
    await _handler.send(config.ip, 6004, "Dev.Power?", onDataReceive: (y) {
      final int res = int.parse(y);
      i = res;
    });
    return i;
  }

  Future<void> mute({required IPetPort config}) async {
    await _handler.send(
      config.ip,
      config.port,
      "Mod.In.Mute=1 1",
    );
    Fluttertoast.showToast(msg: "LM44 est réduit au silence");
  }

  Future<void> unmute({required IPetPort config}) async {
    await _handler.send(
      config.ip,
      config.port,
      "Mod.In.Mute=1 0",
    );
    Fluttertoast.showToast(msg: "LM44 volume restauré");
  }
}
