import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/most_recently_section.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_item.dart';
import 'package:islami/tabs/quran/quran_service.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (query) {
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),

        MostRecentlySection(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Sura List', style: textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suraSearchResults[index];
              return InkWell(
                onTap: () async {
                  QuranService.addSuraToMostRecently(sura);
                  await Navigator.of(
                    context,
                  ).pushNamed(SuraDetailsScreen.routeName, arguments: sura);
                  setState(() {});
                },
                child: SuraItem(sura),
              );
            },
            itemCount: QuranService.suraSearchResults.length,
            separatorBuilder: (_, __) => Divider(
              thickness: 1,
              color: AppTheme.white,
              indent: screenWidth * 0.1,
              endIndent: screenWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
