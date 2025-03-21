import 'package:e_commerce_app/widgets/favorites_view_header.dart';
import 'package:flutter/cupertino.dart';

class FavoritesViewWidget extends StatelessWidget {
  const FavoritesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [SliverToBoxAdapter(child: FavoritesViewHeader())],
      ),
    );
  }
}
