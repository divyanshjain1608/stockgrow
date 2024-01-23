import 'package:flutter/material.dart';

class RealHomePage extends StatelessWidget {
  const RealHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image Icon at Left Top
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2815/2815428.png', // Replace with your actual image asset path
              width: 30.0,
              height: 30.0,
            ),

            // Three Line Icon at Right Top
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle three line icon click
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 203, 224, 247),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 100.0),
            // Row 1: "Play free MOPO"
            buildRowWithText(context, "Play free MOPO", '/'),

            // Spacer
            const SizedBox(height: 100.0),

            // Row 2: "Play fant"
            buildRowWithText(context, "Play fant", '/stock'),

            // Spacer
            const SizedBox(height: 100.0),

            // Row 3: "Play patfan3"
            buildRowWithText(context, "Play patfan3", '/'),
          ],
        ),
      ),
    );
  }

  Widget buildRowWithText(BuildContext context, String text, String target) {
    return Container(
      height: 100.0,
      decoration:
          BoxDecoration(border: Border.all(width: 2.0), color: Colors.white),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, target);
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
