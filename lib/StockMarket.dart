import 'package:flutter/material.dart';

class StockMarket extends StatelessWidget {
  const StockMarket({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // "Choose Stock Market" Text in Center
            Text(
              'Choose Stock Market',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),

            // Three Buttons in Row - NSE, LSE, NYSE
            buildButtonRow(["NSE", "LSE", "NYSE"]),
            SizedBox(height: 16.0),

            // Three Buttons in Row - BSE, TSE, SSE
            buildButtonRow(["BSE", "TSE", "SSE"]),
            SizedBox(height: 16.0),

            // A Squared Box with Round Edges - "ADVERTS" Text
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 500,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.grey[300],
              ),
              child: Text(
                'Adverts',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons.map((buttonText) {
        return ElevatedButton(
          onPressed: () {
            // Handle button click
          },
          child: Text(buttonText),
        );
      }).toList(),
    );
  }
}
