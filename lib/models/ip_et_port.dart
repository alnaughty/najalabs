class IPetPort {
  final String ip;
  final int port;
  const IPetPort({
    required this.ip,
    /* Default port for sending, 6004 for receiving */
    this.port = 6015,
  });
}
