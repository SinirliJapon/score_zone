import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/provider/team_info_provider.dart';
import 'package:score_zone/utils/colors.dart';

class CustomMatchStatusSwitch extends StatelessWidget {
  final String teamId;
  
  const CustomMatchStatusSwitch({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeamInfoProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(getMatchStatus(provider.matchStatus)),
          Switch(
            activeColor: teamInfoScreenColor,
            activeTrackColor: primaryText,
            inactiveThumbColor: secondaryText,
            value: provider.matchStatus == 'FINISHED',
            onChanged: (value) {
              provider.toggleMatchStatus(teamId);
            },
          ),
        ],
      ),
    );
  }
}

String getMatchStatus(String status) {
  if (status == 'SCHEDULED') {
    return 'Scheduled Matches';
  } else {
    return 'Finished Matches';
  }
}