import 'package:flutter/material.dart';

class AverageText extends StatelessWidget {
  final int goalDifference;
  const AverageText({
    super.key,
    required this.goalDifference,
  });

  @override
  Widget build(BuildContext context) {
    return Text(goalDifference > 0 ? '+$goalDifference' : goalDifference.toString());
  }
}