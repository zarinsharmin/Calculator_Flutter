import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayText = '0';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'DEL') {
        if (displayText.length > 1) {
          displayText = displayText.substring(0, displayText.length - 1);
        } else {
          displayText = '0';
        }
      } else if (buttonText == '=') {
        // Calculation logic can be added here
      } else if (buttonText == 'C') {
        displayText = '0';
      } else {
        if (displayText == '0') {
          displayText = buttonText;
        } else {
          displayText += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
            backgroundColor: buttonColor,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton('DEL', Colors.blue),
                  buildButton('=', Colors.blue),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1', Colors.orange),
                  buildButton('2', Colors.orange),
                  buildButton('3', Colors.orange),
                  buildButton('/', Colors.green),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4', Colors.orange),
                  buildButton('5', Colors.orange),
                  buildButton('6', Colors.orange),
                  buildButton('-', Colors.green),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('7', Colors.orange),
                  buildButton('8', Colors.orange),
                  buildButton('9', Colors.orange),
                  buildButton('X', Colors.green),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('0', Colors.orange),
                  buildButton('%', Colors.green),
                  buildButton('+', Colors.green),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
