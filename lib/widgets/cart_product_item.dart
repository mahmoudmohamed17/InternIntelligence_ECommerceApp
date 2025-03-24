import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.height * 0.18),
      decoration: BoxDecoration(
        color: AppColors.itemBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: SizedBox(
              width: context.width * 0.30,
              child: CachedNetworkImage(
                imageUrl: product.productImages.first,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget:
                    (context, url, error) => const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.65,
                child: Text(
                  product.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bold16.copyWith(
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              SizedBox(
                width: context.width * 0.65,
                child: Text(
                  r'$'
                  '${product.productPrice.toStringAsFixed(2)}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semibold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
