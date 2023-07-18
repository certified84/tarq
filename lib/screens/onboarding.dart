import 'package:flutter/material.dart';
import 'package:tarq/data/model/onboarding_item.dart';
import 'package:tarq/screens/signup.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late double _deviceHeight, _deviceWidth;

  final onboardingItems = [
    OnboardingItem("assets/images/onboarding1.png", "Access",
        "Your finance work starts here. Our here to help you track and deal with speeding up your transactions."),
    OnboardingItem(
        "assets/images/onboarding2.png",
        "The fastest transaction process only here",
        "Get easy to pay all your bills with just a few steps. Paying your bills becoome fast and efficient"),
    OnboardingItem("assets/images/onboarding1.png", "title", "description"),
  ];
  final _pageController = PageController();
  var currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _pageController.addListener(
      () => setState(() {
        currentPage = _pageController.page!;
      }),
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.05,
            vertical: _deviceHeight * .02,
          ),
          height: _deviceHeight,
          width: _deviceWidth,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _deviceHeight * .6,
                    child: PageView(
                      controller: _pageController,
                      children: onboardingItems
                          .map((e) => _onboaringItemWidget(e))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: onboardingItems
                        .map((e) => _pageIndicator(_pageController.hasClients &&
                            _pageController.page! == currentPage))
                        .toList(),
                  ),
                  SizedBox(
                    width: _deviceWidth * .85,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF3734A9)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
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

  Widget _onboaringItemWidget(OnboardingItem onboardingItem) {
    return SizedBox(
      width: _deviceWidth * .9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(onboardingItem.image)),
          Text(
            onboardingItem.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            onboardingItem.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _pageIndicator(bool isSelected) {
    if (isSelected) {
      return (Container(
        width: 32,
        height: 12,
        decoration: const BoxDecoration(
            color: Color(0xFF4F46BA),
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ));
    } else {
      return (Container(
        width: 20,
        height: 12,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 183, 186, 193),
          shape: BoxShape.circle,
        ),
      ));
    }
  }
}
