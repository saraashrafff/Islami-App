import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/onBoarding/onBoarding_screens.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
  await QuranService.getMostRecentlySura();
  runApp(IslamiApp(isFirstRun: isFirstRun));
}

class IslamiApp extends StatelessWidget {
  final bool isFirstRun;

  const IslamiApp({super.key, required this.isFirstRun});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingScreens.routeName: (_) => OnBoardingScreens(),
        HomeScreen.routName: (_) => HomeScreen(),
        SuraDetailsScreen.RouteName: (_) => SuraDetailsScreen(),
      },
      initialRoute: isFirstRun
          ? OnBoardingScreens.routeName
          : HomeScreen.routName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
