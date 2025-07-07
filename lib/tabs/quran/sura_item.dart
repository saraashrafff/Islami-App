import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem(this.sura, {super.key});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 52,
              width: 52,
              margin: EdgeInsets.only(right: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/surah_number_frame.png'),
                ),
              ),
              child: Text('${sura.num}', style: textTheme.titleLarge),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sura.englishName, style: textTheme.titleLarge),
            Text('${sura.ayatCount} Verses', style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text(sura.arabicName, style: textTheme.titleLarge),
      ],
    );
  }
}
