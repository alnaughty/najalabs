import 'package:flutter/services.dart';

class IpTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    final StringBuffer newText = StringBuffer();
    final String formattedValue = newValue.text;

    // Only allow digits and dots
    for (int i = 0; i < formattedValue.length; i++) {
      if (formattedValue[i].contains(RegExp(r'[0-9\.]'))) {
        newText.write(formattedValue[i]);
      }
    }

    // Limit input to 15 characters
    if (newText.length > 15) {
      return oldValue;
    }
    return newValue.copyWith(text: newText.toString());

    // return TextEditingValue(
    //   text: newText.toString(),
    //   selection: TextSelection.collapsed(offset: newText.length),
    // );
  }
  // @override
  // TextEditingValue formatEditUpdate(
  //     TextEditingValue oldValue, TextEditingValue newValue) {
  //   final StringBuffer newText = StringBuffer();
  //   final String formattedValue = newValue.text;

  //   // Apply IP address formatting
  //   // if (newValue.selection.baseOffset == 0) {
  //   //   // When the cursor is at the beginning
  //   //   newText.write(_formatIp(formattedValue));
  //   // } else {
  //   //   // When the cursor is elsewhere
  //   //   newText.write(formattedValue);
  //   // }

  //   // // Ensure the length does not exceed 15 characters
  //   // if (newText.length > 15) {
  //   //   return oldValue;
  //   // }

  //   // return TextEditingValue(
  //   //   text: newText.toString(),
  //   //   selection: newValue.selection.copyWith(
  //   //     baseOffset: newText.length,
  //   //     extentOffset: newText.length,
  //   //   ),
  //   // );
  // }

  // String _formatIp(String value) {
  //   final StringBuffer formattedIp = StringBuffer();

  //   // Split input by dots
  //   final List<String> octets = value.split('.');

  //   // Append formatted octets
  //   for (int i = 0; i < octets.length; i++) {
  //     if (i > 0) {
  //       formattedIp.write('.');
  //     }
  //     formattedIp.write(octets[i]);
  //   }

  //   return formattedIp.toString();
  // }
}
