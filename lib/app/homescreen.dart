// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstNum = '';
  String secondNum = '';
  String result = '';
  String second_result = "";
  String selectedOp = '';

  _onButtonPressed(String value) {
    setState(() {
      switch (value) {
        case "/":
        case "*":
        case "-":
        case "+":
          if (firstNum != '') {
            _calculateResult();
          } else {
            firstNum = secondNum;
          }
          secondNum = '';
          selectedOp = value;
          break;

        case "+/-":
          secondNum = convertStringToDouble(secondNum) < 0
              ? secondNum.replaceAll("-", '')
              : "-$secondNum";
          result = secondNum;
          break;

        case "%":
          secondNum = (convertStringToDouble(secondNum) / 100).toString();
          result = secondNum;
          break;

        case "=":
          _calculateResult();
          firstNum = '';
          selectedOp = '';
          break;

        case "C":
          _resetCalci();
          break;
        default:
          secondNum = secondNum + value;
          result = secondNum;
          second_result = firstNum;
      }
    });
  }

  void _calculateResult() {
    double _firstNum = convertStringToDouble(firstNum);

    double _secondNum = convertStringToDouble(secondNum);

    switch (selectedOp) {
      case "+":
        _firstNum = _firstNum + _secondNum;
        break;

      case "-":
        _firstNum = _firstNum - _secondNum;
        break;

      case "/":
        _firstNum = _firstNum / _secondNum;
        break;

      case "*":
        _firstNum = _firstNum * _secondNum;
        break;
      default:
        break;
    }

    secondNum = (_firstNum % 1 == 0 ? _firstNum.toInt() : _firstNum).toString();

    result = secondNum;
  }

  void _resetCalci() {
    firstNum = '';
    secondNum = '';
    result = '';
    selectedOp = '';
    second_result = '';
  }

  convertStringToDouble(String number) {
    return double.tryParse(number);
  }

  void _dragToDelete() {
    setState(() {
      if (result.length > 1) {
        result = result.substring(0, result.length - 1);
        secondNum = result;
      } else {
        result = '';
        secondNum = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.green,
              Colors.grey,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 18),
                  child: Text(
                    firstNum,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
                  child: Text(
                    selectedOp,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
                  child: Text(
                    secondNum,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onHorizontalDragEnd: (details) => {_dragToDelete()},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
                child: Text(
                  result,
                  style: TextStyle(
                      fontSize: result.length > 5 ? 50 : 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.61,
              child: Center(child: _buildButtonGrid()),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGrid() => StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: buttons.length,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        itemBuilder: (context, index) {
          return MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 7,
            padding: const EdgeInsets.all(0),
            color: (buttons[index].value == selectedOp && secondNum != "")
                ? Colors.white
                : buttons[index].bgColor,
            splashColor: Colors.purple,
            onPressed: () {
              _onButtonPressed(buttons[index].value);
            },
            child: Text(
              buttons[index].value,
              style: TextStyle(
                  fontSize: buttons[index].value == '=' ? 55 : 30,
                  fontWeight: FontWeight.bold,
                  color: (buttons[index].value == selectedOp && secondNum != "")
                      ? Colors.black
                      : buttons[index].fgColor),
            ),
          );
        },
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(buttons[index].value == '=' ? 2 : 1, 1),
      );
}
