import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/widgets/search_product_item.dart';
import 'package:flutter/material.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    super.key,
    required this.matchQuery,
    required this.query,
  });
  final List<ProductEntity> matchQuery;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(8),
        query.isEmpty
            ? const SizedBox()
            : Text(
              'Results(${matchQuery.length})',
              style: AppTextStyles.regular14,
            ),
        verticalSpace(16),
        Expanded(
          child: ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SearchProductItem(product: matchQuery[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
