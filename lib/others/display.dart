import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Display {
  static uiMode() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static String getDate(){
    String data = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String hour = DateFormat('HH:mm:ss').format(DateTime.now());
    return '$data as $hour';
  }
}
