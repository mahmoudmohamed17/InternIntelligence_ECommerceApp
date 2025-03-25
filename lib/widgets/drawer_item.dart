import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/models/drawer_item_model.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.model});
  final DrawerItemModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(model.icon, color: AppColors.primaryColor),
      title: Text(model.title, style: AppTextStyles.regular14),
      onTap: model.onTap,
    );
  }
}
