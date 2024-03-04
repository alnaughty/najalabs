extension IP on String {
  bool get isValidIPv4 {
    final List<String> octets = split('.');

    // Check if there are exactly 4 octets
    if (octets.length != 4) {
      return false;
    }

    // Check each octet
    for (String octet in octets) {
      // Check if the octet is a valid integer
      if (int.tryParse(octet) == null) {
        return false;
      }
      int value = int.parse(octet);
      // Check if the octet is in the range [0, 255]
      if (value < 0 || value > 255) {
        return false;
      }
    }

    return true;
  }
}
