import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget{
   final String text;
    final Function callback;
   final Color backColor;
  const CalculatorButton({required this.text, required this.callback, required this.backColor});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 70,
        width: 70,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          onPressed: ()=> callback(text),
          color: backColor,
          textColor: Colors.black,
          child: Text(text,
            style: TextStyle(
                fontSize: 24
            ),
          ),
        ),
      ),
    );
  }
}
