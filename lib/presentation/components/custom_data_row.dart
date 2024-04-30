import 'package:flutter/material.dart';
import 'package:score_zone/presentation/components/build_image.dart';

class CustomDataRow extends StatelessWidget {
  const CustomDataRow({
    super.key,
    required this.teamCrest,
    required this.teamTla,
  });

  final String teamCrest;
  final String teamTla;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildImage(url: teamCrest),
        const SizedBox(width: 5),
        Text(teamTla, style: const TextStyle(fontWeight: FontWeight.w900)),
      ],
    );
  }
}