import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:flutter/material.dart';

class EmptySearchBody extends StatelessWidget {
  const EmptySearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpace(context.height * 0.05),
            Image.asset(
              Assets.imagesNoSearchResults,
              fit: BoxFit.cover,
            ),
            const Text(
              'Sorry, we couldn\'t find any matching results!',
              textAlign: TextAlign.center,
              style: AppTextStyles.semibold18,
            ),
          ],
        ),
      ),
    );
  }
}
