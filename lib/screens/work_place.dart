import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';
import 'package:dotted_border/dotted_border.dart';

class WorkPlaceScreen extends StatefulWidget {
  const WorkPlaceScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WorkPlaceScreenState();
}

class _WorkPlaceScreenState extends State<WorkPlaceScreen> {
  late double _deviceHeight, _deviceWidth;
  var stateExpanded = false;

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
                      'STEP 2 OF 3',
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
                      'Work Place Details',
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
                    'Name of Work Place Details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    hintText: 'Please enter your workplace name',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    hintText: 'Please enter address of Work place',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'State',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  dropdownTextField(
                    width: _deviceWidth,
                    expanded: stateExpanded,
                    hintText: 'Please Enter phone number',
                    onPressed: () {
                      setState(() {
                        stateExpanded = !stateExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Upload ID Card'),
                  const SizedBox(
                    height: 8.0,
                  ),
                  DottedBorder(
                    dashPattern: const [3, 3],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    color: const Color(0xFF8C8C8C),
                    strokeWidth: 1.5,
                    child: Container(
                      height: 55.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Icon(Icons.card)
                        ],
                      ),
                    ),
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
                      width: _deviceWidth * 0.7,
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
