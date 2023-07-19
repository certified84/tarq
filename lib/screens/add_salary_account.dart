import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';

class AddSalaryAccountScreen extends StatefulWidget {
  const AddSalaryAccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddSalaryAccountScreenState();
}

class _AddSalaryAccountScreenState extends State<AddSalaryAccountScreen> {
  late double _deviceHeight, _deviceWidth;
  var stateExpanded = false;
  var verifySuccess = false;

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
                      'STEP 3 OF 3',
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
                      'Add Salary Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please add the account you want us to credit the amount you want to.',
                    style: TextStyle(
                      color: Color(0xFF8692A6),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Note: We will only credit your salary account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Your Account Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    hintText: 'Enter Account Number',
                  ),
                  const SizedBox(height: 16),
                  dropdownTextField(
                    width: _deviceWidth,
                    expanded: stateExpanded,
                    hintText: 'Select bank',
                    onPressed: () {
                      setState(() {
                        stateExpanded = !stateExpanded;
                        verifySuccess = !verifySuccess;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  if (verifySuccess)
                    textField(
                      width: _deviceWidth,
                      readOnly: true,
                      hintText: 'Your Account Name',
                    ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your Info is safely secured',
                        style: TextStyle(
                          color: Color(0xFF8C8C8C),
                          fontSize: 12,
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
