import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  /// method show toast message
  static Future showToastMsg({
    required title,
  }) async {
    return await Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// method navigate page

  static String myName = "";
  static String? userid;
  static String? userRole;
  static Color kprimarycolor = const Color(0xff2B475E);
}
