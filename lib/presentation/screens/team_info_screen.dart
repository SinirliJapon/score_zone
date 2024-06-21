import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/team_squad.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/provider/team_info_provider.dart';

@RoutePage()
class TeamInfoScreen extends StatelessWidget {
  final String leagueCode;
  final String teamId;

  const TeamInfoScreen({Key? key, required this.leagueCode, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TeamInfoProvider>(context, listen: false).fetchTeamSquad(teamId);
    });

    return Consumer<TeamInfoProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.errorMessage != null) {
        return Center(child: Text(value.errorMessage!));
      } else if (value.teamSquad!.isEmpty) {
        return const Center(child: Text('No team info available...'));
      } else {
        return Scaffold(
          backgroundColor: leagueColors[leagueCode] ?? Colors.grey,
          appBar: AppBar(
            foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            title: Text(value.teamName),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TeamSquad(leagueCode: leagueCode, teamSquad: value.teamSquad!),
          ),
        );
      }
    });
  }
}


