import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/managers/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/models/category_item_model.dart';
import 'package:e_commerce_app/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key, this.onTap});
  final Function(String)? onTap;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text('Search By Category', style: AppTextStyles.semibold18.copyWith()),
        SizedBox(
          height: 112,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _models.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == _models.length - 1 ? 0 : 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _activeIndex = index;
                    });
                    widget.onTap?.call(_models[index].endpoint);
                    context.read<HomeCubit>().getProducts(
                      endpoint: _models[index].endpoint,
                    );
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

final List<CategoryItemModel> _models = [
  CategoryItemModel(
    text: 'Shirts',
    image: Assets.imagesShirts,
    endpoint: AppConstants.shirtEndpoint,
  ),
  CategoryItemModel(
    text: 'Shoes',
    image: Assets.imagesShoes,
    endpoint: AppConstants.shoesEndpoint,
  ),
  CategoryItemModel(
    text: 'Jewelry',
    image: Assets.imagesJewelry,
    endpoint: AppConstants.jewelleryEndpoint,
  ),
  CategoryItemModel(
    text: 'Laptops',
    image: Assets.imagesLaptops,
    endpoint: AppConstants.laptopsEndpoint,
  ),
  CategoryItemModel(
    text: 'Smartphones',
    image: Assets.imagesSmartphone,
    endpoint: AppConstants.smartphonesEndpoint,
  ),
  CategoryItemModel(
    text: 'Sunglasses',
    image: Assets.imagesSunglasses,
    endpoint: AppConstants.sunglassesEndpoint,
  ),
];
