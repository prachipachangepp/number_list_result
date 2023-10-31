import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<int> numbers = [10, 20, 30, 40, 50];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(numbers: numbers),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<int> numbers;

  MyHomePage({required this.numbers});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? selectedNumber;
  String result = '';

  void calculateResult() {
    if (selectedNumber != null) {
      // Perform the desired calculation based on the selected number
      result = 'Result: ${selectedNumber! * 2}'; // Just an example calculation
    } else {
      result = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number List Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<int>(
              value: selectedNumber,
              hint: Text('Select a number'),
              onChanged: (int? newValue) {
                setState(() {
                  selectedNumber = newValue;
                  calculateResult();
                });
              },
              items: widget.numbers.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text(
              result,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
