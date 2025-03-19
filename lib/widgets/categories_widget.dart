import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/models/category_item_model.dart';
import 'package:e_commerce_app/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  static final List<CategoryItemModel> _models = [
    CategoryItemModel(text: 'Men', image: Assets.imagesMen, onTap: () {}),
    CategoryItemModel(text: 'Women', image: Assets.imagesWomen, onTap: () {}),
    CategoryItemModel(
      text: 'Electronics',
      image: Assets.imagesElectronics,
      onTap: () {},
    ),
    CategoryItemModel(text: 'Beauty', image: Assets.imagesBeauty, onTap: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Search By Category',
          style: AppTextStyles.semibold18.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
        SizedBox(
          height: 107,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _models.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 3 ? 0 : 16),
                child: CategoryItem(model: _models[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
