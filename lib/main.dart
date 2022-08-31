import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String output = "0";
  String _output = "0";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  buttonPressed(String buttonText){

    switch (buttonText){
      case "CLEAR":
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
        break;
      case "+":
        num1 = int.parse(output);
        operand = buttonText;
        _output = "";
        break;
      case "=":
        num2 = int.parse(output);
        _output = (num1 + num2).toString();
        num1 = 0;
        num2 = 0;
        operand = "";
        break;
      default:
        _output = _output + buttonText;
        break;
    }

    setState(() {
      output = int.parse(_output).toString();

    });

  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(24.0)
        ),
        child: Text(buttonText,
          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0
                ),
                child: Text(output, style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,

                ))),
            const Expanded(
              child: Divider(),
            ),


            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
              ]),

              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
              ]),

              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
              ]),

              Row(children: [
                buildButton("="),
                buildButton("0"),
                buildButton("CLEAR"),
              ]),

              Row(children: [
                buildButton("+"),
              ])
            ])
          ],
        ));
  }

}
