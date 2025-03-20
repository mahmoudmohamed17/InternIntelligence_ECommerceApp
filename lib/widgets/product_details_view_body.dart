import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/product_details_view_content.dart';
import 'package:e_commerce_app/widgets/product_details_view_footer.dart';
import 'package:e_commerce_app/widgets/product_details_view_header.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: ProductDetailsViewHeader()),
        SliverToBoxAdapter(child: verticalSpace(16)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProductDetailsViewContent(),
          ),
        ),

        SliverToBoxAdapter(child: verticalSpace(24)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ProductDetailsViewFooter(),
          ),
        ),

        const SliverFillRemaining(
          hasScrollBody: false,
          child: Expanded(child: SizedBox()),
        ),
      ],
    );
  }
}
