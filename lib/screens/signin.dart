import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  'Welcome back Sign in to your account',
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
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF5F5FE0),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),
                const SizedBox(height: 24),
                Align(
                  child: actionButton(
                    width: _deviceWidth,
                    text: 'Sign In',
                    onPressed: () => {},
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
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign Up',
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
