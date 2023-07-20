import 'package:flutter/material.dart';
import 'package:tarq/data/model/setup_info.dart';
import 'package:tarq/screens/add_salary_account.dart';
import 'package:tarq/screens/bvn_input.dart';
import 'package:tarq/screens/complete_profile.dart';
import 'package:tarq/screens/work_place.dart';

class AccountSetupProgressScreen extends StatefulWidget {
  const AccountSetupProgressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountSetupProgressScreenState();
}

class _AccountSetupProgressScreenState
    extends State<AccountSetupProgressScreen> {
  late double _deviceHeight, _deviceWidth;

  final accountSetupInfoList = [
    SetupInfo(
      'Verify Your Email',
      'Please confirm the validity of your email by verifying it.',
      const Color(0xFFF9D897),
      'assets/svgs/mail.svg',
      'email',
      isCompleted: true,
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * .05,
            vertical: _deviceHeight * .02,
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  Ink(
                    width: 45,
                    height: 45,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF4F46BA),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                      tooltip: 'Close button',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Set up your account',
                    style: TextStyle(
                      color: Color(0xFF1D3A70),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...accountSetupInfoList.map((e) => _progressWidget(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _progressWidget(SetupInfo setupInfo) {
    return GestureDetector(
        onTap: () {
          switch (setupInfo.which) {
            case 'email':
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: setupInfo.isCompleted
                    ? const Text('Email already verified')
                    : const Text('Check your email for a verification link'),
              ));
              break;

            case 'personnal':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BvnInputScreen()));
              break;

            case 'work':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkPlaceScreen()));
              break;

            case 'card':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddSalaryAccountScreen()));
              break;

            default:
              break;
          }
        },
        child: Container(
          width: _deviceWidth,
          padding: const EdgeInsets.only(top: 16),
          child: Card(
            color: Colors.white,
            elevation: .2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: setupInfo.isCompleted
                              ? const Color(0xFF4F46BA)
                              : const Color(0xFF4D9CFF),
                          width: setupInfo.isCompleted ? 4 : 1,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(4),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        setupInfo.title,
                        style: const TextStyle(
                          color: Color(0xFF4F46BA),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: _deviceWidth * .7,
                        child: Text(setupInfo.description),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
