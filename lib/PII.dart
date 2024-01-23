import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 203, 224, 247),
        elevation: 0,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            // Human Icon with "Personal Information" Text
            buildIconWithText(),

            // Spacer
            const SizedBox(height: 16.0),

            // Upload Image Option
            buildUploadImageOption(),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "Full Name" Text and TextField
            buildInputRow("Full Name"),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "ADDRESS" Text and TextField
            buildInputRow("ADDRESS"),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "State" Text and TextField
            buildInputRow("State"),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "Aadhar Card" Text and TextField
            buildInputRow("Aadhar Card"),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "Pan Number" Text and TextField
            buildInputRow("Pan Number"),

            // Spacer
            const SizedBox(height: 16.0),

            // Row with "Phone" Text and TextField
            buildInputRow("Phone"),

            // Spacer
            const SizedBox(height: 16.0),

            // Save Button
            buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildIconWithText() {
    return const Row(
      // ignore: prefer_const_literals_to_create_immutables
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person,
          size: 60.0,
          color: Color.fromARGB(255, 14, 7, 107),
        ),
        SizedBox(height: 8.0),
        Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 14, 7, 107),
          ),
        ),
      ],
    );
  }

  Widget buildUploadImageOption() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Upload an Image',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Handle image upload
            },
            child: const Text('Choose Image'),
          ),
        ],
      ),
    );
  }

  Widget buildInputRow(String labelText) {
    return Row(
      children: [
        Container(
          width: 120.0, // Adjust the width as needed
          child: Text(
            labelText,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle save button click
        Navigator.pushNamed(context, '/real-home-page');
      },
      child: const Text('Save'),
    );
  }
}
