import 'package:carruncy_converter/modules/calculator/CalcBtn.dart';
import 'package:carruncy_converter/shared/components/constens.dart';
import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  int? firstNumber;

  int? secondNumber;

  String? hitory = '';

  String? textToDisplay = '';

  String? res;

  String? operation;

  void btnOnClick(String value) {
    print(value);
    if (value == 'C') {
      textToDisplay = '';
      res = '';
      firstNumber = 0;
      secondNumber = 0;
    }
    else if (value == 'AC')
    {
      textToDisplay = '';
      res = '';
      firstNumber = 0;
      secondNumber = 0;
      hitory = '';
    }
    else if (value == '+/-')
    {
      if (textToDisplay![0] != '-') {
        res = '-' + textToDisplay!;
      } else {
        res = textToDisplay!.substring(1);
      }
    } else if (value == '<')
    {
      
        res = textToDisplay!.substring(0,textToDisplay!.length -1);
     
    }
    else if (value == '+' || value == '-' || value == 'x' || value == '/') {
      firstNumber = int.parse(textToDisplay!);
      res = '';
      operation = value;
    }
    else if (value == '=') {
      secondNumber = int.parse(textToDisplay!);
      if (operation == '+') {
        res = (firstNumber! + secondNumber!).toString();
        hitory = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '-') {
        res = (firstNumber! - secondNumber!).toString();
        hitory = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == 'x') {
        res = (firstNumber! * secondNumber!).toString();
        hitory = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '/') {
        res = (firstNumber! / secondNumber!).toString();
        hitory = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    }
    else {
      res = int.parse(textToDisplay! + value).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 12),
            alignment: Alignment(1.0, 1.0),
            child: Text(
              hitory!,
              style: TextStyle(fontSize: 24, color: Color(0x66FFFFFF)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment(1.0, 1.0),
            child: Text(
              textToDisplay!,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  text: 'AC',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: 'C',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '<', callback: btnOnClick, backColor: defColor),
              CalculatorButton(
                  text: '+', callback: btnOnClick, backColor: defColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  text: '9',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '8',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '7',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '-', callback: btnOnClick, backColor: defColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  text: '4',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '5',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '6',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: 'x', callback: btnOnClick, backColor: defColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  text: '1',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '2',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '3',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '/', callback: btnOnClick, backColor: defColor),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalculatorButton(
                  text: '+/-',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '0',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '00',
                  callback: btnOnClick,
                  backColor: Color(0xFF8ac4d0)),
              CalculatorButton(
                  text: '=', callback: btnOnClick, backColor: defColor),
            ],
          ),
        ],
      ),
    );
  }
}
