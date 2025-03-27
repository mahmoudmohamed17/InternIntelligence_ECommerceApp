import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:e_commerce_app/widgets/empty_search_body.dart';
import 'package:e_commerce_app/widgets/search_results_widget.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<ProductEntity> products;
  final String endpoint;
  CustomSearchDelegate({required this.products, required this.endpoint});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.clear,
          color:
              SharedPrefs.getBool(AppConstants.isDarkMode)
                  ? Colors.white
                  : Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color:
            SharedPrefs.getBool(AppConstants.isDarkMode)
                ? Colors.white
                : Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductEntity> matchQuery = [];
    for (var item in products) {
      if (item.productName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:
          matchQuery.isEmpty
              ? const EmptySearchBody()
              : SearchResultsWidget(matchQuery: matchQuery, query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductEntity> matchQuery = [];
    for (var item in products) {
      if (item.productName.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child:
          matchQuery.isEmpty
              ? const EmptySearchBody()
              : SearchResultsWidget(matchQuery: matchQuery, query: query),
    );
  }
}
