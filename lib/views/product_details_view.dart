import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductEntity product;
  static const String id = AppRouting.productDetailsView;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Scaffold(body: ProductDetailsViewBody(product: product));
      },
    );
  }
}
