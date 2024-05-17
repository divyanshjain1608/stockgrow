import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Name'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button 1
            buildButton(1),

            // Button 2
            buildButton(2),

            // Button 3
            buildButton(3),

            // Button 4
            buildButton(4),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int number) {
    return ElevatedButton(
      onPressed: () {
        // Handle button click
      },
      child: Text('$number'),
    );
  }
}
