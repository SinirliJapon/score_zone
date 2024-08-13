import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/presentation/components/custom_info_row.dart';
import 'package:score_zone/presentation/components/match_list.dart';
import 'package:score_zone/presentation/components/team_squad.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/provider/team_info_provider.dart';
import 'package:score_zone/utils/icons.dart';

@RoutePage()
class TeamInfoScreen extends StatelessWidget {
  final String leagueName;
  final String teamId;

  const TeamInfoScreen({Key? key, required this.leagueName, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TeamInfoProvider>(context, listen: false).fetchTeamSquad(teamId);
    });

    return Consumer<TeamInfoProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.errorMessage != null) {
          return Center(child: Text(value.errorMessage!));
        } else if (value.teamSquad!.isEmpty) {
          return const Center(child: Text('No team info available...'));
        } else {
          final team = value.team!;
          final coach = value.team!.coach;
          final matches = value.teamMatches!;
          return Scaffold(
            backgroundColor: secondaryText,
            appBar: AppBar(
              backgroundColor: teamInfoScreenColor,
              foregroundColor: primaryText,
              title: Text(team.name!),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: BuildImage(url: team.area.flag!, width: 30),
                ),
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(child: BuildImage(url: team.crest!, width: 200)),
                  const SizedBox(height: 20),
                  CustomExpansionTile(
                    title: 'Team Info',
                    icon: Icons.info,
                    isOpen: true,
                    primaryColor: teamInfoScreenColor,
                    secondaryColor: primaryText,
                    children: [
                      CustomInfoRow(icon: Icons.area_chart_outlined, info: 'Area', data: team.area.name!),
                      CustomInfoRow(icon: Icons.sports_soccer_outlined, info: 'League', data: leagueName),
                      CustomInfoRow(icon: Icons.flag, info: 'Founded', data: team.founded.toString()),
                      CustomInfoRow(icon: Icons.stadium, info: 'Stadium', data: team.venue!),
                      CustomInfoRow(icon: Icons.groups, info: 'Squad Size', data: value.squadSize.toString()),
                      CustomInfoRow(icon: Icons.functions, info: 'Average Age', data: value.averageAge!),
                      CustomInfoRow(icon: Icons.palette, info: 'Club Colors', data: team.clubColors!),
                    ],
                  ),
                  CustomExpansionTile(
                    title: 'Coach',
                    icon: Icons.sports,
                    isOpen: true,
                    primaryColor: teamInfoScreenColor,
                    secondaryColor: primaryText,
                    children: [
                      CustomInfoRow(icon: Icons.sports, info: 'Name', data: coach!.name!),
                      CustomInfoRow(icon: Icons.alarm_add, info: 'Age', data: value.coachAge!),
                      CustomInfoRow(icon: Icons.location_on, info: 'Nationality', data: coach.nationality!),
                      CustomInfoRow(icon: contractStart, info: 'Contract Start', data: value.coachStart!),
                      CustomInfoRow(icon: contractUntil, info: 'Contract Until', data: value.coachUntil!),
                    ],
                  ),
                  CustomExpansionTile(
                    title: 'Squad',
                    icon: Icons.people,
                    isOpen: true,
                    primaryColor: teamInfoScreenColor,
                    secondaryColor: primaryText,
                    children: [
                      TeamSquad(leagueCode: leagueName, teamSquad: value.teamSquad!),
                    ],
                  ),
                  CustomExpansionTile(
                    isOpen: true,
                    icon: Icons.sports_soccer,
                    title: 'Team Matches',
                    primaryColor: teamInfoScreenColor,
                    secondaryColor: primaryText,
                    children: [
                      MatchList(matches: matches, isScroll: false),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
