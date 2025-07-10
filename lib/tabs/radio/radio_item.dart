import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/app_theme.dart';

class RadioItemClass {
  String radioImage;
  String radioName;
  String soundStatus;
  String playStatus;

  RadioItemClass({
    required this.radioName,
    required this.playStatus,
    required this.soundStatus,
    required this.radioImage,
  });
}

class RadioItem extends StatelessWidget {
  RadioItemClass radioItem;

  RadioItem({super.key, required this.radioItem});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.15,
            decoration: BoxDecoration(color: AppTheme.primary),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/radio_${radioItem.radioImage}_item_background.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                radioItem.radioName,
                style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 175,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/${radioItem.playStatus}.svg',
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/${radioItem.soundStatus}.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
