import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/product_rate_badge.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FavoritesProductItem extends StatelessWidget {
  const FavoritesProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouting.productDetailsView);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: context.height * 0.45,
              maxWidth: context.width * 0.55,
            ),
            decoration: BoxDecoration(
              color: AppColors.itemBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.heart,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
                verticalSpace(8),
                Expanded(
                  child: Image.asset(
                    Assets.imagesHello,
                    height: context.height * 0.20,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                verticalSpace(8),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Text(
                    'Product Name dsfdsfdsfd sadsadd',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
                verticalSpace(4),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Text(
                    'Product Description',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.medium12.copyWith(
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ProductRateBadge(),
        ],
      ),
    );
  }
}
