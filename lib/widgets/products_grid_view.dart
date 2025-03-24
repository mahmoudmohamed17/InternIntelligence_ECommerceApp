import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/managers/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.status == HomeStatus.failed) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.failureMessage,
                style: AppTextStyles.semibold18,
              ),
            ),
          );
        } else if (state.products.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'There\'s no products!',
                style: AppTextStyles.semibold18,
              ),
            ),
          );
        }
        return SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return const ProductItem();
          }, childCount: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: context.height * 0.50,
          ),
        );
      },
    );
  }
}
