import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarq/components/buttons.dart';
import 'package:tarq/data/model/setup_info.dart';
import 'package:tarq/screens/account_setup/account_setup_progress.dart';

class AccountSetupScreen extends StatelessWidget {
  AccountSetupScreen({Key? key}) : super(key: key);
  late double _deviceHeight, _deviceWidth;
  final accountSetupInfoList = [
    SetupInfo(
      'Verify Your Email',
      'Please confirm the validity of your email by verifying it.',
      const Color(0xFFF9D897),
      'assets/svgs/mail.svg',
      'email',
    ),
    SetupInfo(
      'Fill your personal details ',
      'Completely fill all the details required from your personal information',
      const Color(0xFF97BEF9),
      'assets/svgs/person.svg',
      'personnal',
    ),
    SetupInfo(
      'Setup Your Work Place Details',
      'Please complete all the required fields with your workplace information.',
      const Color(0xFF97F9E1),
      'assets/svgs/work_filled.svg',
      'work',
    ),
    SetupInfo(
      'Add Card',
      'Please add the card associated with your bank account.',
      const Color(0xFFF9AF97),
      'assets/svgs/credit_card.svg',
      'card',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: _deviceWidth,
          padding: EdgeInsets.only(
            bottom: _deviceHeight * .05,
            left: _deviceWidth * .05,
            right: _deviceWidth * .05,
          ),
          child: ListView(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Set up your account',
                  style: TextStyle(
                    color: Color(0xFF1D3A70),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'To fully activate your account and become eligible for a loans, your need to provide the following information.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 110,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5E5AE3),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Image(
                      image: AssetImage('assets/images/debit_card.png')),
                ),
              ),
              const SizedBox(height: 16),
              ...accountSetupInfoList
                  .map((e) => _informationWidget(e))
                  .toList(),
              const SizedBox(height: 32),
              actionButton(
                width: _deviceHeight * .85,
                text: 'Start',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AccountSetupProgressScreen()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _informationWidget(SetupInfo setupInfo) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: setupInfo.color,
                borderRadius: BorderRadius.circular(5),
              ),
              // child: SvgPicture.asset(
              //   setupInfo.icon,
              //   semanticsLabel: 'Setup Info Icon',
              // ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              width: _deviceWidth * .79,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    setupInfo.title,
                    style: const TextStyle(
                      color: Color(0xFF1D3A70),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    setupInfo.description,
                    style: const TextStyle(
                      color: Color(0xFF80858A),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
