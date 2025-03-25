import 'package:e_commerce_app/services/firebase_service.dart';
import 'package:e_commerce_app/views/main_view.dart';
import 'package:e_commerce_app/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

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
            final firebaseSerive = FirebaseService();
            var products = await firebaseSerive.getAllProducts();
            // ignore: use_build_context_synchronously
            showSearch(context: context, delegate: CustomSearchDelegate(products));
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
