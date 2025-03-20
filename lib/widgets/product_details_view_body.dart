import 'package:e_commerce_app/widgets/product_details_view_header.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [SliverToBoxAdapter(child: ProductDetailsViewHeader())],
    );
  }
}
