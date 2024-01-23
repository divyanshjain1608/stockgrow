import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String correctOTP =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo with Width 80%
            Image.network(
              "https://media.istockphoto.com/id/1224392587/vector/web.jpg?s=612x612&w=0&k=20&c=9vgtlyHp6UbSgK3tfizM8RYuFjNGwpJ0HWrLGHqyt1w=", // Replace with your actual logo asset path
              width: MediaQuery.of(context).size.width * 0.8,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40.0),

            // "Enter Verification Code" Text with Backward Arrow
            buildTextWithBackwardArrow("Enter Verification Code"),

            // "We have sent an OTP to your phone number" Text
            const Text(
              'We have sent an OTP to your phone number',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),

            // 4 Boxes for OTP Digits
            // buildOtpDigitRow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOtpTextField(otpController1, 1),
                buildOtpTextField(otpController2, 2),
                buildOtpTextField(otpController3, 3),
                buildOtpTextField(otpController4, 4),
              ],
            ),

            // Spacer
            const SizedBox(height: 16.0),

            // Keypad to Enter OTP
            buildOtpKeypad(),

            // Spacer
            const SizedBox(height: 40.0),

            // Verify OTP Button
            ElevatedButton(
              onPressed: () {
                // Handle Verify OTP button click
                String enteredOTP = getOtp();

                // Check if the entered OTP is correct
                if (enteredOTP == correctOTP) {
                  // OTP is correct, navigate to the next screen
                  Navigator.pushNamed(context, '/profile-setup');
                } else {
                  // OTP is incorrect, show an error message or handle correction logic
                  // For simplicity, you can show a Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incorrect OTP. Please try again.'),
                    ),
                  );
                }
              },
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  String getOtp() {
    return otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;
  }

  Widget buildOtpTextField(TextEditingController controller, int index) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1 && index < 4) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && index > 1) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget buildTextWithBackwardArrow(String text) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back arrow click
          },
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildOtpKeypad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return buildKeypadButton(index + 1);
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return buildKeypadButton(index + 4);
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            return buildKeypadButton(index + 7);
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildKeypadButton(0),
          ],
        ),
      ],
    );
  }

  Widget buildKeypadButton(int digit) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            // if the button is pressed the elevation is 10.0, if not
            // it is 5.0
            if (states.contains(MaterialState.pressed)) return 20.0;
            return 15.0;
          },
        ),
      ),
      onPressed: () {
        // Handle keypad button click
      },
      child: Text('$digit'),
    );
  }
}
