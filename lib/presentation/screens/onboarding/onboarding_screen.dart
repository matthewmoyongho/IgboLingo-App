import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/presentation/screens/onboarding/onboarding_screens_items.dart';

import '../../../core/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int onboardingIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: kOnBoardingContents.length,
          onPageChanged: (index) {
            onboardingIndex = index;
          },
          itemBuilder: (context, index) => Container(
            color: kSecondaryColor,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                    // height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        onboardingIndex > 0
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _pageController.previousPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.bounceIn);
                                  });
                                },
                                icon: Icon(Icons.arrow_back))
                            : Expanded(child: SizedBox()),
                        const SkipButton(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    // height: 91,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Container(
                      color: Colors.red,
                      width: double.infinity,
                      height: 200,
                      child: Image(
                        image: AssetImage(
                          kOnBoardingContents[onboardingIndex]['picture'],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      kOnBoardingContents[index]['title'],
                      style: GoogleFonts.irishGrover(
                        color: Color(0XFF060606),
                        height: 1.2,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      kOnBoardingContents[index]['body'],
                      style: GoogleFonts.poppins(
                        color: Color(0XFF060606).withOpacity(0.7),
                        height: 1.2,
                        fontSize: 12,
                        // fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  buildDots(context, onboardingIndex, kPrimaryColor),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: buildElevatedButton(
                      deviceSize,
                      onboardingIndex,
                      () => setState(
                        () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
