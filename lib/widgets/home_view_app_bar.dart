import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/views/main_view.dart';
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
          icon: const Icon(
            FontAwesomeIcons.barsStaggered,
            color: AppColors.primaryTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
