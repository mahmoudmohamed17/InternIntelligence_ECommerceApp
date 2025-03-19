import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/models/category_item_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});
  final CategoryItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((e) {
          model.onTap;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Card(
            color: Colors.white,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                model.image,
                height: 70,
                width: 70,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            model.text,
            style: AppTextStyles.medium12.copyWith(
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
