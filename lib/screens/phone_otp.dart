import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';
import 'package:tarq/screens/complete_profile.dart';

class PhoneOTPScreen extends StatefulWidget {
  const PhoneOTPScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends State<PhoneOTPScreen> {
  late double _deviceWidth, _deviceHeight;
  var otp = '';
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: _deviceWidth,
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * .05,
          vertical: _deviceHeight * .02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 45,
                height: 45,
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Verify it's you",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'We sent a verification code to the phone number you registered your BVN with. Enter it here to verify your identity',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF444444),
              ),
            ),
            const SizedBox(height: 32),
            otpTextField(
              width: 50,
              length: 5,
              context: context,
              onFilled: (code) => {
                otp = code,
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(code),
                ))
              },
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend Code',
                  style: TextStyle(
                    color: Color(0xFF1DAB87),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            actionButton(
              width: _deviceWidth,
              text: 'Confirm',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(otp),
                ));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompleteProfileScreen()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
