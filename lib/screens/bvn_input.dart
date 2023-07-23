import 'package:flutter/material.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/components/textfields.dart';
import 'package:tarq/screens/phone_otp.dart';

class BvnInputScreen extends StatefulWidget {
  const BvnInputScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BvnInputScreenState();
}

class _BvnInputScreenState extends State<BvnInputScreen> {
  late double _deviceHeight, _deviceWidth;
  var phoneExpanded = false;
  var stateExpanded = false;
  var lgaExpanded = false;
  var showBvnInfo = false;
  final questions = [
    {
      'question': 'What is a BVN?',
      'answer':
          'This is your Bank Verification Number which is unique to each person.'
    },
    {
      'question': 'Why do we ask for it?',
      'answer':
          'We request for your BVN to verify your identity and confirm that the account you registered with is yours. It is also a KYC requirement for all financial institutions by the Central Bank of Nigeria (CBN).'
    },
    {
      'question': 'Where can you find it?',
      'answer':
          'To know your BVN, dial *565*0# from the phone number linked to your bank account. Please note that your provider may charge N20 for each check.'
    },
  ];

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
                      'Provide Your BVN',
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
                    'Bank Verification Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  textField(
                    width: _deviceWidth,
                    hintText: 'Please enter your BVN',
                    keyboardType: TextInputType.number,
                    onPressed: () {
                      setState(() {
                        phoneExpanded = !phoneExpanded;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0x994F46BA),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              size: 18.0,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Why do we need your BVN?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showBvnInfo = !showBvnInfo;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          showBvnInfo ? 'Hide' : 'View',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        showBvnInfo
                                            ? const Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 18.0,
                                                color: Colors.white,
                                              )
                                            : const Icon(
                                                Icons.chevron_right,
                                                size: 18.0,
                                                color: Colors.white,
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (showBvnInfo)
                          ...questions
                              .map((e) =>
                                  _questionWidget(e['question']!, e['answer']!))
                              .toList(),
                      ],
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhoneOTPScreen()));
                      },
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

  Widget _questionWidget(String question, String answer) {
    return SizedBox(
      width: _deviceWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
