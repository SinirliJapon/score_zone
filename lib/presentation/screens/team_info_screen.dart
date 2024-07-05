import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/team_squad.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/provider/team_info_provider.dart';
import 'package:score_zone/utils/functions.dart';

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
          return Scaffold(
            backgroundColor: premierSecondary,
            appBar: AppBar(
              backgroundColor: premierPrimary,
              foregroundColor: premierSecondary,
              title: Text(team.name!),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: BuildImage(url: team.area.flag!, width: 30),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(child: BuildImage(url: team.crest!, width: 200)),
                  const SizedBox(height: 20),
                  TeamExpansionTile(
                    title: 'Team Info',
                    children: [
                      TeamInfoRow(icon: Icons.area_chart_outlined, info: 'Area', data: team.area.name!),
                      TeamInfoRow(icon: Icons.sports_soccer_outlined, info: 'League', data: leagueName),
                      TeamInfoRow(icon: Icons.flag, info: 'Founded', data: team.founded.toString()),
                      TeamInfoRow(icon: Icons.stadium, info: 'Stadium', data: team.venue!),
                      TeamInfoRow(icon: Icons.groups, info: 'Squad Size', data: value.squadSize.toString()),
                      TeamInfoRow(icon: Icons.functions, info: 'Average Age', data: value.averageAge!),
                      TeamInfoRow(icon: Icons.palette, info: 'Club Colors', data: team.clubColors!),
                    ],
                  ),
                  TeamExpansionTile(
                    title: 'Coach',
                    children: [
                      TeamInfoRow(icon: Icons.sports, info: 'Name', data: coach!.name!),
                      TeamInfoRow(icon: Icons.alarm_add, info: 'Age', data: value.coachAge!),
                      TeamInfoRow(icon: Icons.location_on, info: 'Nationality', data: coach.nationality!),
                      TeamInfoRow(
                        icon: Icons.play_circle_fill_outlined,
                        info: 'Contract Start',
                        data: Functions.formatDate(coach.contract.start!),
                      ),
                      TeamInfoRow(
                        icon: Icons.pause_circle_outlined,
                        info: 'Contract Until',
                        data: Functions.formatDate(coach.contract.until!),
                      ),
                    ],
                  ),
                  TeamExpansionTile(
                    title: 'Squad',
                    children: [
                      TeamSquad(leagueCode: leagueName, teamSquad: value.teamSquad!),
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

class TeamInfoRow extends StatelessWidget {
  final IconData icon;
  final String info;
  final String data;

  const TeamInfoRow({super.key, required this.icon, required this.info, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(info),
      trailing: Text(data, style: const TextStyle(fontSize: 16)),
      iconColor: premierPrimary,
      textColor: premierPrimary,
      tileColor: premierSecondary,
    );
  }
}

class TeamExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const TeamExpansionTile({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      collapsedBackgroundColor: premierPrimary,
      collapsedIconColor: premierSecondary,
      collapsedTextColor: premierSecondary,
      backgroundColor: premierSecondary,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      children: children,
    );
  }
}
