import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast({required String message, Color textColor = Colors.green}) {
  Fluttertoast.showToast(
      msg: message,
      //toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.grey[50],
      textColor: textColor,
      fontSize: 16.0);
}
