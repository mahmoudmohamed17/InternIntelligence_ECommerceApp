import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/widgets/favorites_product_item.dart';
import 'package:flutter/material.dart';

class FavoriteProductsGridView extends StatelessWidget {
  const FavoriteProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) {
        return const FavoritesProductItem();
      },
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: context.height * 0.45,
      ),
    );
  }
}
