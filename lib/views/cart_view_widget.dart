import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class CartViewWidget extends StatelessWidget {
  const CartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(children: [CustomHeader(title: 'Cart')]));
  }
}
