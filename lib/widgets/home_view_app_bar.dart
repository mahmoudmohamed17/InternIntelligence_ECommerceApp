import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/views/main_view.dart';
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
            Navigator.pushNamed(context, AppRouting.notificationsView);
          },
          icon: const Icon(FontAwesomeIcons.solidBell),
        ),
      ],
    );
  }
}
