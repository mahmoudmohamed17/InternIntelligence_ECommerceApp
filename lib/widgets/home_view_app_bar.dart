import 'package:e_commerce_app/services/notifications_service.dart';
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
          icon: const Icon(FontAwesomeIcons.barsStaggered),
        ),
        IconButton(
          onPressed: () {
            NotificationsService().sendLocalNotification(title: 'Test Notification', body: 'Hello World!');
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
