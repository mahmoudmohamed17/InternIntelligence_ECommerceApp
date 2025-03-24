import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/widgets/cart_product_item.dart';
import 'package:flutter/material.dart';

class CartProductsListView extends StatelessWidget {
  const CartProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(index),
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
            padding: EdgeInsets.only(bottom: index == 9 ? 0 : 8),
            child:  CartProductItem(),
          ),
        );
      },
    );
  }
}
