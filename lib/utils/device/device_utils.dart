import 'package:flutter/material.dart';

class DeviceUtils {
  static double getStatusBarHeight(context){
    return MediaQuery.of(context).padding.top;
  }
}