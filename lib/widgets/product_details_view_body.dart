import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/product_details_view_content.dart';
import 'package:e_commerce_app/widgets/product_details_view_footer.dart';
import 'package:e_commerce_app/widgets/product_details_view_header.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
         SliverToBoxAdapter(child: ProductDetailsViewHeader(product: product,)),
        SliverToBoxAdapter(child: verticalSpace(16)),
         SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProductDetailsViewContent(product: product,),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(24)),
         SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ProductDetailsViewFooter(product: product,),
          ),
        ),
      ],
    );
  }
}
