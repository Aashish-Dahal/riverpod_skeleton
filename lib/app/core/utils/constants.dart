import 'package:flutter/material.dart' show Color;

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

List<String> goRouterProps = [
  "Route Parameters",
  "Query Parameters",
  "go concept",
  "goNamed concept",
  "push concept",
  "pushNamed concept",
  "Error Handling",
  "Redirection"
];
