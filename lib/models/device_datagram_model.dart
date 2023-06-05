class DeviceDatagramModel {
  final String name;
  final String ip;
  const DeviceDatagramModel({
    required this.name,
    required this.ip,
  });
  factory DeviceDatagramModel.fromJson(Map<String, dynamic> json) =>
      DeviceDatagramModel(
        name: json['name'],
        ip: json['ip'],
      );
}
