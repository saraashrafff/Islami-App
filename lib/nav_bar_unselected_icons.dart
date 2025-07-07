import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';

class NavBarUnselectedIcons extends StatelessWidget {
  String iconName;

  NavBarUnselectedIcons({super.key, required this.iconName});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(AppTheme.black, BlendMode.srcIn),
    );
  }
}
