import 'package:flutter/material.dart';

class Button {
  final String value;
  final Color bgColor;
  final Color fgColor;

  Button(this.value, this.bgColor, this.fgColor);
}

List<Button> buttons = [
  Button("C", Colors.orange, Colors.black),
  Button("+/-", Colors.orange, Colors.black),
  Button("%", Colors.orange, Colors.black),
  Button("/", Colors.blue, Colors.black),
  Button("7", Colors.white24, Colors.black),
  Button("8", Colors.white24, Colors.black),
  Button("9", Colors.white24, Colors.black),
  Button("*", Colors.blue, Colors.black),
  Button("4", Colors.white24, Colors.black),
  Button("5", Colors.white24, Colors.black),
  Button("6", Colors.white24, Colors.black),
  Button("+", Colors.blue, Colors.black),
  Button("1", Colors.white24, Colors.black),
  Button("2", Colors.white24, Colors.black),
  Button("3", Colors.white24, Colors.black),
  Button("-", Colors.blue, Colors.black),
  Button(".", Colors.white24, Colors.black),
  Button("0", Colors.white24, Colors.black),
  Button("=", Colors.red, Colors.black),
];
