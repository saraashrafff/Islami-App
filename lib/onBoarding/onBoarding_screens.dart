import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/onBoarding/on_boarding.dart';
import 'package:islami/onBoarding/onBoardingItem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreens extends StatefulWidget {
  static const routeName = '/';

  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnbordingScreensState();
}

class _OnbordingScreensState extends State<OnBoardingScreens> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Image.asset(
                'assets/images/header.png',
                height: MediaQuery.sizeOf(context).height * 0.15,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (_, index) =>
                      OnBoardingItem(onBoardingPages[index]),
                  itemCount: onBoardingPages.length,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex != 0
                      ? InkWell(
                          onTap: () {
                            goToPreviousPage();
                            setState(() {});
                          },
                          child: Text(
                            'Back',
                            style: textTheme.titleMedium!.copyWith(
                              color: AppTheme.primary,
                            ),
                          ),
                        )
                      : SizedBox(width: 25),
                  SmoothPageIndicator(
                    controller: controller,
                    count: onBoardingPages.length,
                    effect: WormEffect(
                      activeDotColor: AppTheme.primary,
                      dotColor: AppTheme.grey,
                      dotHeight: 7,
                      dotWidth: 7,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      currentIndex == onBoardingPages.length - 1
                          ? finishOnBoarding()
                          : goToNextPage();
                      setState(() {});
                    },
                    child: Text(
                      currentIndex == onBoardingPages.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.primary,
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

  void goToNextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> finishOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstRun', false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
}
