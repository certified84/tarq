import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';
import 'package:tarq/screens/account_setup/account_setup.dart';
import 'package:tarq/screens/signin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late double _deviceHeight, _deviceWidth;
  var showPassword = false;
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
              vertical: _deviceHeight * .05,
            ),
            child: ListView(
              children: [
                const Text(
                  'Hi There! 👋',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Text(
                  'Create an account to get started',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 32),
                textField(
                  width: _deviceWidth,
                  hintText: 'Email',
                ),
                const SizedBox(height: 16),
                passwordTextField(
                  width: _deviceWidth,
                  showPassword: showPassword,
                  hintText: 'Password',
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Align(
                  child: actionButton(
                    width: _deviceWidth,
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountSetupScreen()));
                    },
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1.5,
                      width: _deviceWidth * .4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8, 1),
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFCCCCCC),
                          ], // Gradient
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xFFCCCCCC),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1.5,
                      width: _deviceWidth * .4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(1, 1),
                          colors: <Color>[
                            Color(0xFFCCCCCC),
                            Colors.white,
                          ], // Gradient
                          tileMode: TileMode.mirror,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    googleButton(
                      width: _deviceWidth * .43,
                      onPressed: () => {},
                    ),
                    appleButton(
                      width: _deviceWidth * .43,
                      onPressed: () => {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF1DAB87),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
