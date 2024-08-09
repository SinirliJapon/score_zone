
import 'package:flutter/material.dart';
import 'package:score_zone/utils/styles.dart';

class CustomTeamNameContainer extends StatelessWidget {
  final String teamTla;
  const CustomTeamNameContainer({
    Key? key,
    required this.teamTla,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text(teamTla, style: Styles.matchTeamTextStyle())),
    );
  }
}
