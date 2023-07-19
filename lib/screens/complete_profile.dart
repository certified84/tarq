import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late double _deviceHeight, _deviceWidth;
  var phoneExpanded = false;
  var stateExpanded = false;
  var lgaExpanded = false;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF8C8C8C),
      bottomSheet: Container(
        color: const Color(0xFF8C8C8C),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          height: _deviceHeight * .7,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * .05,
            vertical: 24,
          ),
          width: _deviceWidth,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'STEP 1 OF 3',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F46BA),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Complete Your Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'For the purpose of industry regulation, your details are required.',
                    style: TextStyle(
                      color: Color(0xFF8692A6),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Phone number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  dropdownTextField(
                    width: _deviceWidth,
                    expanded: phoneExpanded,
                    hintText: 'Your phone number',
                    onPressed: () {
                      setState(() {
                        phoneExpanded = !phoneExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Full Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    readOnly: true,
                    hintText: 'Your full name',
                    onPressed: () {
                      setState(() {
                        phoneExpanded = !phoneExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Address',
                    style: TextStyle(
                      color: Color(0xFF8C8C8C),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    hintText: 'Please enter your address',
                    onPressed: () {
                      setState(() {
                        phoneExpanded = !phoneExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'State of Residence',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  dropdownTextField(
                    width: _deviceWidth,
                    expanded: stateExpanded,
                    hintText: 'Please select',
                    onPressed: () {
                      setState(() {
                        stateExpanded = !stateExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'LGA of Residence',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  dropdownTextField(
                    width: _deviceWidth,
                    expanded: lgaExpanded,
                    hintText: 'Please select',
                    onPressed: () {
                      setState(() {
                        lgaExpanded = !lgaExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Info is safely secured',
                        style: TextStyle(
                          color: Color(0xFF8C8C8C),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.lock_outline,
                        size: 15.0,
                        color: Color(0xFF8C8C8C),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: actionButton(
                      width: _deviceWidth,
                      text: 'Save & Continue',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
