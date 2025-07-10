import 'package:flutter/material.dart';
import '../../app_theme.dart';

class ToggleButtonContainer extends StatelessWidget {
  final bool selected;
  final String label;

  const ToggleButtonContainer({
    super.key,
    required this.selected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: selected
            ? AppTheme.selectedToggleDecoration
            : AppTheme.unselectedToggleDecoration,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 7),
        child: Text(
          label,
          style: selected
              ? textTheme.titleMedium!.copyWith(
                  color: AppTheme.black,
                  fontWeight: FontWeight.w400,
                )
              : textTheme.titleMedium,
        ),
      ),
    );
  }
}
