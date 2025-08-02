import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/models/category_data.dart';
import 'package:flutter/material.dart';

class TabBarItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final bool isSelected;

  const TabBarItemWidget({
    super.key,
    required this.categoryData,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        spacing: 6,
        children: [
          Icon(
            categoryData.icon,
            color: isSelected ? ColorPallete.primaryColor : Colors.white,
          ),
          Text(
            categoryData.name,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? ColorPallete.primaryColor : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
