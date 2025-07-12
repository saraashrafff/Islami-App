import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const routeName = '/hadeth-details';

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    double screenHeight = MediaQuery.sizeOf(context).height;
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hadeth ${hadeth.num}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  hadeth.title,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                Image.asset(
                  'assets/images/details_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, index) => SizedBox(height: 12),
              itemCount: hadeth.content.length,
            ),
          ),
          Image.asset(
            'assets/images/details_footer.png',
            height: screenHeight * 0.1,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
