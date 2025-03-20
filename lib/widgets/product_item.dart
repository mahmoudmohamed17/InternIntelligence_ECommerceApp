import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/assets.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/widgets/product_rate_badge.dart';
import 'package:e_commerce_app/widgets/product_salary_and_buy_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: context.height * 0.45, maxWidth: context.width * 0.55),
          decoration: BoxDecoration(
            color: AppColors.itemBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isActive = !_isActive;
                      });
                    },
                    icon: Icon(
                      _isActive
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
              Image.asset(
                Assets.imagesHello,
                height: context.height * 0.20,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
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
              const ProductSalaryAndBuyButton(),
            ],
          ),
        ),
        const ProductRateBadge(),
      ],
    );
  }
}
