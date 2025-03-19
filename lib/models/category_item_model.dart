import 'package:flutter/material.dart';

class CategoryItemModel {
  final String text;
  final String image;
  final VoidCallback onTap;

  CategoryItemModel({
    required this.text,
    required this.image,
    required this.onTap,
  });
}
