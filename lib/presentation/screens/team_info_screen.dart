import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/presentation/components/custom_info_row.dart';
import 'package:score_zone/presentation/components/custom_tab_bar.dart';
import 'package:score_zone/presentation/components/match_list.dart';
import 'package:score_zone/presentation/components/team_info_screen/team_squad.dart';
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
          final finishedMatches = value.finishedMatches;
          final timedMatches = value.timedMatches;
          final upcomingMatches = value.upcomingMatches;
          return Scaffold(
            backgroundColor: secondaryText,
            appBar: AppBar(
              backgroundColor: teamInfoScreenColor,
              foregroundColor: primaryText,
              title: Text(team.name!),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: BuildImage(url: team.area.flag!, width: 30),
                  ),
                ),
              ],
            ),
            body: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(child: BuildImage(url: team.crest!, width: 200)),
                  const SizedBox(height: 20),
                  const CustomTabBar(
                    indicatorColor: teamInfoScreenColor,
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'Squad'),
                      Tab(text: 'Results'),
                      Tab(text: 'Fixtures'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            CustomExpansionTile(
                              title: 'Team Info',
                              icon: AppIcons.teamInfoIcon,
                              isOpen: true,
                              primaryColor: teamInfoScreenColor,
                              secondaryColor: primaryText,
                              children: [
                                CustomInfoRow(icon: AppIcons.teamAreaIcon, info: 'Area', data: team.area.name!),
                                CustomInfoRow(icon: AppIcons.teamLeagueIcon, info: 'League', data: leagueName),
                                CustomInfoRow(icon: AppIcons.teamFoundedIcon, info: 'Founded', data: team.founded.toString()),
                                CustomInfoRow(icon: AppIcons.teamStadiumIcon, info: 'Stadium', data: team.venue!),
                                CustomInfoRow(icon: AppIcons.teamSqaudSizeIcon, info: 'Squad Size', data: value.squadSize.toString()),
                                CustomInfoRow(icon: AppIcons.teamAverageAgeIcon, info: 'Average Age', data: value.averageAge!),
                                CustomInfoRow(icon: AppIcons.teamClubColorsIcon, info: 'Club Colors', data: team.clubColors!),
                              ],
                            ),
                            CustomExpansionTile(
                              title: 'Coach',
                              icon: AppIcons.coachInfoIcon,
                              isOpen: true,
                              primaryColor: teamInfoScreenColor,
                              secondaryColor: primaryText,
                              children: [
                                CustomInfoRow(icon: AppIcons.coachNameIcon, info: 'Name', data: coach!.name!),
                                CustomInfoRow(icon: AppIcons.coachAgeIcon, info: 'Age', data: value.coachAge!),
                                CustomInfoRow(icon: AppIcons.dateOfBirthIcon, info: 'Date Of Birth', data: value.coachBirth!),
                                CustomInfoRow(icon: AppIcons.nationalityIcon, info: 'Nationality', data: coach.nationality!),
                                CustomInfoRow(icon: AppIcons.startIcon, info: 'Contract Start', data: value.coachStart!),
                                CustomInfoRow(icon: AppIcons.endIcon, info: 'Contract Until', data: value.coachUntil!),
                              ],
                            ),
                          ],
                        ),
                        ListView(
                          children: [
                            TeamSquad(leagueCode: leagueName, teamSquad: value.teamSquad!),
                          ],
                        ),
                        ListView(
                          children: [
                            CustomExpansionTile(
                              isOpen: true,
                              icon: AppIcons.finishedMatchesIcon,
                              title: 'Finished Matches',
                              primaryColor: teamInfoScreenColor,
                              secondaryColor: primaryText,
                              children: [
                                MatchList(matches: finishedMatches!, isFinished: true),
                              ],
                            ),
                          ],
                        ),
                        ListView(
                          children: [
                            CustomExpansionTile(
                              isOpen: true,
                              icon: AppIcons.timedMatchesIcon,
                              title: 'Timed Matches',
                              primaryColor: teamInfoScreenColor,
                              secondaryColor: primaryText,
                              children: [
                                MatchList(matches: timedMatches!, isFinished: false),
                              ],
                            ),
                            CustomExpansionTile(
                              isOpen: true,
                              icon: AppIcons.scheduledMatchesIcon,
                              title: 'Scheduled Matches',
                              primaryColor: teamInfoScreenColor,
                              secondaryColor: primaryText,
                              children: [
                                MatchList(matches: upcomingMatches!, isFinished: false),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
