import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_details.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) loadHadeth();
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/hadeth_header_left.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeth != null)
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        hadeth!.title,
                        style: textTheme.headlineSmall!.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                    ),
                  Image.asset(
                    'assets/images/hadeth_header_right.png',
                    height: screenHeight * 0.1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/hadeth_card_background.png',
                    ),
                  ),
                ),
                child: (hadeth == null)
                    ? LoadingIndicator()
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => Text(
                          hadeth!.content[index],
                          textAlign: TextAlign.center,
                          style: textTheme.titleMedium!.copyWith(
                            color: AppTheme.black,
                          ),
                        ),
                        separatorBuilder: (_, __) => SizedBox(height: 4),
                        itemCount: hadeth!.content.length,
                      ),
              ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContent = await rootBundle.loadString(
      'assets/text/h${widget.index + 1}.txt',
    );
    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
