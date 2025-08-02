import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/models/category_data.dart';
import 'package:flutter/material.dart';

class CreateEventTabBarItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final bool isSelected;

  const CreateEventTabBarItemWidget({
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
        color: isSelected ? ColorPallete.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: ColorPallete.primaryColor),
      ),
      child: Row(
        spacing: 6,
        children: [
          Icon(
            categoryData.icon,
            color: isSelected ? Colors.white : ColorPallete.primaryColor,
          ),
          Text(
            categoryData.name,
            style: theme.textTheme.titleSmall?.copyWith(
              color: isSelected ? Colors.white : ColorPallete.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
