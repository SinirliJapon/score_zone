import 'package:flutter/material.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/icons.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(AppIcons.appInfoIcon),
        onPressed: () {
          String title = 'Welcome to Score Zone';
          String details =
              'Access the data of the popular leagues and cups in the world.\nSome data can be outdated or incomplete because of the free plan.\n';
          Functions.showPopup(context, title, details);
        });
  }
}