import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/categories_widget.dart';
import 'package:e_commerce_app/widgets/home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(16)),
          const SliverToBoxAdapter(child: HomeViewAppBar()),
          SliverToBoxAdapter(child: verticalSpace(8)),
          const SliverToBoxAdapter(child: CategoriesWidget()),
        ],
      ),
    );
  }
}
