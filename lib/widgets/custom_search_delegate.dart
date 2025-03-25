import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/widgets/empty_search_body.dart';
import 'package:e_commerce_app/widgets/search_results_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<ProductEntity> list;
  CustomSearchDelegate(this.list);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductEntity> matchQuery = [];
    for (var item in list) {
      if (item.productName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:
          matchQuery.isEmpty
              ? const EmptySearchBody()
              : SearchResultsWidget(matchQuery: matchQuery, query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductEntity> matchQuery = [];
    for (var item in list) {
      if (item.productName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:
          matchQuery.isEmpty
              ? const EmptySearchBody()
              : SearchResultsWidget(matchQuery: matchQuery, query: query),
    );
  }
}
