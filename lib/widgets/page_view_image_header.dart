import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageViewImageHeader extends StatelessWidget {
  const PageViewImageHeader({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: AppColors.primaryTextColor,
          ),
        ),
        IconButton(
          onPressed: () async {
            context.read<ProductCubit>().changeFavoritesStatus(
              context,
              product,
            );
            await context.read<ProductCubit>().updateProduct(product);
          },
          icon: Icon(
            product.isAddedToFavorites
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
