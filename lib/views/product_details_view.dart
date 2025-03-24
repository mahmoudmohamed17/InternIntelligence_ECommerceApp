import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var product = GoRouterState.of(context).extra as ProductEntity;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: ProductDetailsViewBody(product: product,),
    );
  }
}
