import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: AppTextStyles.bold24),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.replace('/');
          },
          icon: const Icon(FontAwesomeIcons.chevronLeft),
        ),
      ),
      body: const NotificationsViewBody(),
    );
  }
}
