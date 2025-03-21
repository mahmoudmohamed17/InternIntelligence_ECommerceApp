import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/widgets/custom_dots_indicator.dart';
import 'package:e_commerce_app/widgets/page_view_image_header.dart';
import 'package:e_commerce_app/widgets/product_images_page_view.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewHeader extends StatefulWidget {
  const ProductDetailsViewHeader({super.key});

  @override
  State<ProductDetailsViewHeader> createState() =>
      _ProductDetailsViewHeaderState();
}

class _ProductDetailsViewHeaderState extends State<ProductDetailsViewHeader> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.itemBackgroundColor),
      child: SizedBox(
        height: context.height * 0.55,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(42),
                child: ProductImagesPageView(pageController: _pageController),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16),
                child: CustomDotsIndicator(currentPage: _currentPage),
              ),
            ),
            const Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                child: PageViewImageHeader(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
