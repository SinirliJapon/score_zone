
import 'package:flutter/material.dart';
import 'package:score_zone/constants/styles.dart';

class CustomTeamNameContainer extends StatelessWidget {
  final String teamTla;
  final String leagueCode;
  const CustomTeamNameContainer({
    Key? key,
    required this.teamTla,
    required this.leagueCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text(teamTla, style: Styles.customMatchTeamTextStyle(leagueCode))),
    );
  }
}
