import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
            context.replace('/');
          },
          icon: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: AppColors.primaryTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.heart,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
