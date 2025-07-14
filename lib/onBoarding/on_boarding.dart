class OnBoarding {
  int index;
  String imageName;
  String text1;
  String text2;

  OnBoarding({
    required this.index,
    required this.imageName,
    required this.text1,
    required this.text2,
  });
}

List<String> onBoardingTextOne = [
  'Welcome To Islmi App',
  'Welcome To Islami',
  'Reading the Quran',
  'Bearish',
  'Holy Quran Radio',
];
List<String> onBoardingTextTwo = [
  '',
  'We Are Very Excited To Have You In Our Community',
  'Read, and your Lord is the Most Generous',
  'Praise the name of your Lord, the Most High',
  'You can listen to the Holy Quran Radio through the application for free and easily',
];

List<OnBoarding> onBoardingPages = List.generate(
  onBoardingTextOne.length,
  (index) => OnBoarding(
    index: index,
    imageName: 'assets/images/on_boarding_${index + 1}.png',
    text1: onBoardingTextOne[index],
    text2: onBoardingTextTwo[index],
  ),
);
