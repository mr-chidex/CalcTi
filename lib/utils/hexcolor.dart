import 'package:flutter/material.dart';

class HexColor extends Color {
  static int getColorFromHex(String hexCode){
    hexCode = hexCode.toUpperCase().replaceAll("#","");

    if(hexCode.length == 6){
      hexCode = "FF" + hexCode;
    }
    return int.parse(hexCode, radix: 16);
  }

  HexColor(String hexCode): super(getColorFromHex(hexCode));
}