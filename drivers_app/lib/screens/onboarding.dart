import 'package:drivers_app/components/onboarding_page_1.dart';
import 'package:drivers_app/components/onboarding_page_2.dart';
import 'package:drivers_app/components/onboarding_page_3.dart';
import 'package:drivers_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const WelcomeScreen();
                      },
                    ),
                  ),
                },
                color: Colors.black,
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: controller,
          children: const <Widget>[
            // page 1
            OnboardingPage1(),
            // page 2
            OnboardingPage2(),
            // page 3
            OnboardingPage3(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0xFF3EA2F9),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => {
                controller.jumpToPage(2),
              },
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xFF3EA2F9),
                  dotColor: Color(0xFFB0B0B0),
                  dotHeight: 10,
                ),
              ),
            ),
            TextButton(
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Color(0xFF3EA2F9),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
