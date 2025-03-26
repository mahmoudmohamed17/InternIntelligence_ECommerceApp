import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/models/notification_item_model.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.model});
  final NotificationItemModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color:
          SharedPrefs.getBool(AppConstants.isDarkMode)
              ? const Color(0xff1E1B20)
              : const Color(0xffe5e8e8),
      elevation: 3,
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
