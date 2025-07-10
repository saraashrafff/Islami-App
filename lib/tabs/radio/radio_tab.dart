import 'package:flutter/material.dart';
import 'package:islami/tabs/radio/radio_item.dart';
import 'package:islami/tabs/radio/toggle_button_container.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

List<bool> isSelected = [true, false];

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Column(
        children: [
          Row(
            children: [
              ToggleButtons(
                renderBorder: false,
                fillColor: Colors.transparent,
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: [
                  ToggleButtonContainer(
                    selected: isSelected[0],
                    label: 'Radio',
                  ),
                  ToggleButtonContainer(
                    selected: isSelected[1],
                    label: 'Reciters',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => RadioItem(
                radioItem: RadioItemClass(
                  radioImage: 'off',
                  radioName: 'Radio Al-Qaria Yassen',
                  soundStatus: 'sound_on',
                  playStatus: 'play',
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
