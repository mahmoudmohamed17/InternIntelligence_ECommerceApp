import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductImagesPageView extends StatelessWidget {
  const ProductImagesPageView({
    super.key,
    required this.pageController,
    required this.productImages,
  });
  final PageController pageController;
  final List<String> productImages;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: productImages.length,
      itemBuilder: (_, index) {
        return CachedNetworkImage(
          imageUrl: productImages[index],
          fit: BoxFit.contain,
          errorWidget:
              (context, url, error) =>
                  const Center(child: Icon(Icons.error, color: Colors.red)),
          placeholder:
              (context, url) =>
                  const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
