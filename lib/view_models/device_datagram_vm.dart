import 'package:najalabs/models/device_datagram_model.dart';
import 'package:rxdart/rxdart.dart';

class DeviceDatagramVm {
  DeviceDatagramVm._pr();
  static final DeviceDatagramVm _instance = DeviceDatagramVm._pr();
  static DeviceDatagramVm get instance => _instance;

  BehaviorSubject<List<DeviceDatagramModel>> _subject =
      BehaviorSubject<List<DeviceDatagramModel>>();
  Stream<List<DeviceDatagramModel>> get stream => _subject.stream;
  List<DeviceDatagramModel> get current => _subject.value;

  void append(DeviceDatagramModel data) {
    List<DeviceDatagramModel> f = List.from(current);
    final List<String> names = f.map((e) => e.name).toList();
    if (!names.contains(data.name)) {
      f.add(data);
      populate(f);
    }
  }

  void populate(List<DeviceDatagramModel> data) {
    _subject.add(data);
  }

  void dispose() {
    _subject = BehaviorSubject<List<DeviceDatagramModel>>();
  }
}
