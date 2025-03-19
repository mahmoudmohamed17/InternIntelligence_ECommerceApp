import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/categories_widget.dart';
import 'package:e_commerce_app/widgets/home_view_app_bar.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          const SliverToBoxAdapter(child: HomeViewAppBar()),
          SliverToBoxAdapter(child: verticalSpace(8)),
          const SliverToBoxAdapter(child: CategoriesWidget()),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: Text(
              'Popular Products',
              style: AppTextStyles.semibold18.copyWith(
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(12)),
          // SliverGrid(
          //   delegate: SliverChildBuilderDelegate((context, index) {
          //     return const ProductItem();
          //   }, childCount: 25),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisSpacing: 12,
          //     crossAxisSpacing: 12,
          //   ),
          // ),
          SliverToBoxAdapter(child: ProductItem()),
        ],
      ),
    );
  }
}
