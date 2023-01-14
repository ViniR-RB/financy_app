import 'package:financy_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'primary_button.dart';

Future<void> customBottomSheet(BuildContext context, String buttonText) {
  return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38.0),
          topRight: Radius.circular(38.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38.0),
              topRight: Radius.circular(38.0),
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                buttonText,
                style: TextStyles.mediumText20
                    .copyWith(color: AppColors.greenlightTwo),
              ),
              const SizedBox(
                height: 12,
              ),
              PrimaryButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  label: 'Tentar Novamente')
            ],
          )),
        );
      });
}
