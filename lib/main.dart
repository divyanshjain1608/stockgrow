import 'dart:convert';

import 'package:fantasticoapp/PII.dart';
import 'package:fantasticoapp/ProfileSetup.dart';
import 'package:fantasticoapp/RealHomePage.dart';
import 'package:fantasticoapp/StockMarket.dart';
import 'package:fantasticoapp/OTPPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/otp': (context) => OTPPage(),
        '/profile-setup': (context) => const ProfileSetup(),
        '/pii': (context) => const ProfileInfo(),
        '/real-home-page': (context) => const RealHomePage(),
        '/stock': (context) => const StockMarket(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FANTASTICO'),
        backgroundColor: const Color.fromARGB(255, 203, 224, 247),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 203, 224, 247),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 0, 26, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
                "https://media.istockphoto.com/id/1224392587/vector/web.jpg?s=612x612&w=0&k=20&c=9vgtlyHp6UbSgK3tfizM8RYuFjNGwpJ0HWrLGHqyt1w="),

            const SizedBox(height: 16.0),
            // Register Text
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),

            // Phone Number Box
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            // More Lorem Ipsum Text
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            // Apple and Google Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Apple button click
                  },
                  child: const Text('Apple'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Google button click
                  },
                  child: const Text('Google'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Sign Up Button
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = phoneNumberController.text;
                String apiUrl =
                    'https://hichers-api-eight.vercel.app/api/v1/auth/generate-otp';

                Map<String, dynamic> requestBody = {
                  "countryCode": "+91",
                  "mobileNumber": phoneNumber
                };

                String requestBodyJson = jsonEncode(requestBody);

                try {
                  var response = await http.post(
                    Uri.parse(apiUrl),
                    headers: {
                      'Content-Type': 'application/json',
                    },
                    body: requestBodyJson,
                  ); 

                  if (response.statusCode == 200) {
                    Map<String, dynamic> responseData =
                        jsonDecode(response.body);

                    String otp = responseData['otp'];
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/otp', arguments: otp);
                  } else {
                    // Handle unsuccessful response (e.g., show an error message)
                  }
                } catch (error) {
                  // Handle any exceptions that may occur during the request
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
