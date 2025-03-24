import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(index),
          onDismissed: (direction) {
            context.read<ProductCubit>().changeCartStatus(products[index]);
          },
          background: Container(
            decoration: const BoxDecoration(color: Colors.red),
            child: Center(
              child: Text(
                'Remove',
                style: AppTextStyles.semibold16.copyWith(color: Colors.white),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: index == products.length - 1 ? 0 : 8,
            ),
            child: CartProductItem(product: products[index]),
          ),
        );
      },
    );
  }
}
