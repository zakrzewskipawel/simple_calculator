// ignore_for_file: deprecated_member_use, avoid_print, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => __HomePageState();
}

class __HomePageState extends State<HomePage> {
  String output = '0';

  String temp = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String history = "";

  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          onPressed: () {
            setState(() {
              if (buttonValue == 'AC') {
                temp = '0';
                num1 = 0;
                num2 = 0;
                operand = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/') {
                num1 = double.parse(output);
                operand = buttonValue;
                temp = '0';
              } else if (buttonValue == '.') {
                if (temp.contains('.')) {
                  print("already contains a decimal");
                  return;
                } else {
                  temp = temp + buttonValue;
                }
              } else if (buttonValue == "=") {
                num2 = double.parse(output);

                if (operand == '+') {
                  temp = (num1 + num2).toString();
                } else if (operand == '-') {
                  temp = (num1 - num2).toString();
                } else if (operand == 'x') {
                  temp = (num1 * num2).toString();
                } else if (operand == '/') {
                  temp = (num1 / num2).toString();
                }
                num1 = 0;
                num2 = 0;
                operand = "";
              } else {
                temp = temp + buttonValue;
              }

              print(temp);
              setState(() {
                output = double.parse(temp).toStringAsFixed(2);
              });

              if (buttonValue != 'AC') {
                history = history + buttonValue;
              } else {
                history = '';
              }
            });
          },
          child: Container(
            child: Text(
              buttonValue,
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
            padding: const EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Simple Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Column(
        children: [
          const Expanded(
            child: Divider(),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
            child: new Text(
              history,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
            child:  Text(
              output,
              style: const TextStyle(
                fontSize: 85,
                color: Colors.black,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildbutton("7", 1),
                  buildbutton("8", 1),
                  buildbutton("9", 1),
                  buildbutton("x", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("4", 1),
                  buildbutton("5", 1),
                  buildbutton("6", 1),
                  buildbutton("-", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("1", 1),
                  buildbutton("2", 1),
                  buildbutton("3", 1),
                  buildbutton("+", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("0", 2),
                  buildbutton(".", 1),
                  buildbutton("/", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("AC", 2),
                  buildbutton("=", 2),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
