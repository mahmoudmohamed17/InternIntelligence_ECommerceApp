import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:e_commerce_app/widgets/favorite_products_grid_view.dart';
import 'package:flutter/cupertino.dart';

class FavoritesViewWidget extends StatelessWidget {
  const FavoritesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomHeader(title: 'Favorites')),
          SliverToBoxAdapter(child: verticalSpace(16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'Total: 9',
                    style: AppTextStyles.semibold18.copyWith(
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(12)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: FavoriteProductsGridView(),
          ),
          SliverToBoxAdapter(child: verticalSpace(8)),
        ],
      ),
    );
  }
}
