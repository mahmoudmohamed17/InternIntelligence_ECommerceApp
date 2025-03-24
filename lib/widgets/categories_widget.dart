import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/models/category_item_model.dart';
import 'package:e_commerce_app/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _activeIndex = 0;

  final List<CategoryItemModel> _models = [
    CategoryItemModel(text: 'Shirts', image: Assets.imagesMen, onTap: () {}),
    CategoryItemModel(text: 'Shoes', image: Assets.imagesWomen, onTap: () {}),
    CategoryItemModel(
      text: 'Jewelry',
      image: Assets.imagesElectronics,
      onTap: () {},
    ),
    CategoryItemModel(text: 'Laptops', image: Assets.imagesBeauty, onTap: () {}),
    CategoryItemModel(text: 'Smartphones', image: Assets.imagesBeauty, onTap: () {}),
    CategoryItemModel(text: 'Sunglasses', image: Assets.imagesBeauty, onTap: () {}),
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
                padding: EdgeInsets.only(right: index == _models.length - 1 ? 0 : 16),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeIndex = index;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((e) {
                      _models[index].onTap;
                    });
                  },
                  child: CategoryItem(
                    model: _models[index],
                    isActive: _activeIndex == index,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
