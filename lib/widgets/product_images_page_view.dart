import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProductImagesPageView extends StatelessWidget {
  const ProductImagesPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 5,
      itemBuilder: (_, index) {
        return Image.asset(Assets.imagesHello, fit: BoxFit.fill);
      },
    );
  }
}
