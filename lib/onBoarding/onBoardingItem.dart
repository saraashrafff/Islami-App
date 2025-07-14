import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/onBoarding/on_boarding.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoarding onBoarding;
  const OnBoardingItem(this.onBoarding, {super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/images/on_boarding_${onBoarding.index + 1}.png'),
          Column(
            children: [
              Text(
                onBoarding.text1,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall!.copyWith(
                  color: AppTheme.primary,
                ),
              ),
              SizedBox(height: 40),
              Text(
                textAlign: TextAlign.center,
                onBoarding.text2,
                style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
