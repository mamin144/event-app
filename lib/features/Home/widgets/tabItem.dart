import 'package:event/core/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import '../../../core/color/AppColors.dart';

class TabItem extends StatelessWidget {
  // final String text;
  // final Widget icon;
  final bool isSelected;
  final CategoryModel categoryModel;

  const TabItem({
    super.key,
    required this.categoryModel,
    // required this.text,
    // required this.icon,
    required this.isSelected ,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Appcolors.primary : Appcolors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            categoryModel.iconPath,
            color: isSelected ? Appcolors.white : Appcolors.primary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            categoryModel.name,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isSelected ? Appcolors.white : Appcolors.mainText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
