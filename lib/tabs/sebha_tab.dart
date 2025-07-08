import 'package:flutter/material.dart';

List<String> sebhaItems = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
int sebhaCount = 0;
int sebhaIndex = 0;
void updateSebha() {
  sebhaCount++;
  if (sebhaCount % 33 == 0) {
    if (sebhaIndex < sebhaItems.length - 1) {
      sebhaIndex += 1;
    } else {
      sebhaIndex = 0;
    }
  }
}

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _rotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Spacer(flex: 1),
          Image.asset('assets/images/sebha_text_header.png'),
          Image.asset('assets/images/sebha_head.png'),
          Expanded(
            flex: 8,
            child: GestureDetector(
              onTap: () {
                updateSebha();
                setState(() {
                  _rotationAngle += 0.1;
                });
              },
              child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Transform.rotate(
                      angle: _rotationAngle,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset('assets/images/sebha_body.png'),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sebhaItems[sebhaIndex],
                              style: textTheme.headlineMedium,
                            ),
                            SizedBox(height: 30),
                            Text(
                              '$sebhaCount',
                              style: textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
