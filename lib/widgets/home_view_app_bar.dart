import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:e_commerce_app/views/main_view.dart';
import 'package:e_commerce_app/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key, required this.endpoint});
  final String endpoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(FontAwesomeIcons.barsStaggered),
        ),
        IconButton(
          onPressed: () async {
            final firebaseService = FirebaseService();
            var products = await firebaseService.getAllProducts();
            showSearch(
              // ignore: use_build_context_synchronously
              context: context,
              delegate: CustomSearchDelegate(
                products: products,
                endpoint: endpoint,
              ),
            );
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
