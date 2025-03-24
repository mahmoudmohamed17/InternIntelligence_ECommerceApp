import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/widgets/favorite_products_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesViewWidget extends StatelessWidget {
  const FavoritesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFavoritesSuccess) {
          return SafeArea(
            child: Column(
              children: [
                const CustomHeader(title: 'Favorites'),
                verticalSpace(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'Total: ${state.products.length}',
                        style: AppTextStyles.semibold18.copyWith(
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(12),
                Expanded(
                  child: FavoriteProductsGridView(products: state.products),
                ),
                verticalSpace(8),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              'You haven\'t add any products yet!',
              style: AppTextStyles.semibold18.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
