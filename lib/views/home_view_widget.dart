import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/categories_widget.dart';
import 'package:e_commerce_app/widgets/home_view_app_bar.dart';
import 'package:e_commerce_app/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key});

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  String endpoint = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
             SliverToBoxAdapter(child: HomeViewAppBar(endpoint: endpoint,)),
            SliverToBoxAdapter(child: verticalSpace(8)),
            SliverToBoxAdapter(
              child: CategoriesWidget(
                onTap: (value) {
                  endpoint = value;
                },
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(16)),
            SliverToBoxAdapter(
              child: Text(
                'Popular Products',
                style: AppTextStyles.semibold18.copyWith(),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(12)),
            const ProductsGridView(),
            SliverToBoxAdapter(child: verticalSpace(8)),
          ],
        ),
      ),
    );
  }
}
