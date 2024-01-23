import 'package:flutter/material.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 224, 247),
        elevation: 0,
        actions: const [Text("data")],
      ),
      backgroundColor: const Color.fromARGB(255, 203, 224, 247),
      body: Padding(
        padding: const EdgeInsets.all(76.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row with Human Icon and "Personal Information" Text
            const SizedBox(height: 150.0),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 40.0,
                  color: Color.fromARGB(255, 14, 7, 107),
                ),
                const SizedBox(width: 16.0),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/pii');
                  },
                  child: const Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 7, 107),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            // Row with Globe Icon and "Wallet" Text
            const Row(
              children: [
                Icon(
                  Icons.language,
                  size: 40.0,
                  color: Color.fromARGB(255, 14, 7, 107),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 7, 107),
                  ),
                ),
              ],
            ),

            const Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 0,
              color: Colors.black,
            ),
            // Row with "Saved Portfolios" Text
            const Row(
              children: [
                Icon(
                  Icons.graphic_eq,
                  size: 40.0,
                  color: Color.fromARGB(255, 14, 7, 107),
                ),
                SizedBox(width: 16.0),
                Text(
                  'Saved Portfolio',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 7, 107),
                  ),
                ),
              ],
            ),

            const Divider(
              height: 20,
              thickness: 2,
              indent: 0,
              endIndent: 10,
              color: Colors.black,
            ),
            // Spacer
            const SizedBox(height: 100.0),

            // Arrow Sign with "Skip, I will do it later" Text
            buildSkipButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildRowWithIconAndText(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 40.0,
          color: const Color.fromARGB(255, 14, 7, 107),
        ),
        const SizedBox(width: 16.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 14, 7, 107),
          ),
        ),
      ],
    );
  }

  Widget buildRowWithText(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 14, 7, 107),
          ),
        ),
      ],
    );
  }

  Widget buildSkipButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // Handle "Skip, I will do it later" button click
            Navigator.pushNamed(context, '/real-home-page');
          },
          child: const Row(
            children: [
              Text(
                'Skip, I will do it later',
                style: TextStyle(fontSize: 16.0),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ],
    );
  }
}
