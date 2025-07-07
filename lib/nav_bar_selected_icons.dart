import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';

class NavBarSelectedIcons extends StatelessWidget {
  String iconName;
  NavBarSelectedIcons({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppTheme.black.withValues(alpha: 0.6),
      ),
      child: SvgPicture.asset(
        'assets/icons/$iconName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
