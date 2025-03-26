import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/models/notification_item_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.model});
  final NotificationItemModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 8,
          children: [
            ListTile(
              leading: const Icon(FontAwesomeIcons.solidBell),
              title: Text(model.content, style: AppTextStyles.semibold16),
              contentPadding: EdgeInsets.zero,
            ),
            Text(model.date, style: AppTextStyles.medium14),
          ],
        ),
      ),
    );
  }
}
