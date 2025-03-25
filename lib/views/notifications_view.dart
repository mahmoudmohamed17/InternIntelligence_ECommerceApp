import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',),
        titleTextStyle: AppTextStyles.bold24,
      ),
    );
  }
}