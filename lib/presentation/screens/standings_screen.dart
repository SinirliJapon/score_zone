import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/presentation/components/cup_standings.dart';
import 'package:score_zone/presentation/components/league_standings.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/styles.dart';

@RoutePage()
class StandingsScreen extends StatelessWidget {
  final String leagueCode;

  const StandingsScreen({Key? key, required this.leagueCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StandingsProvider>(context, listen: false).getStandings(leagueCode);
    });
    return Consumer<StandingsProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.standings.isEmpty) {
          return const Center(child: Text('No standings available...'));
        } else {
          final competitionType = value.competitionType.toString();
          if (competitionType == 'LEAGUE') {
            return LeagueView(value: value);
          } else {
            return CupView(value: value);
          }
        }
      },
    );
  }
}

class LeagueView extends StatelessWidget {
  final StandingsProvider value;

  const LeagueView({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final leagueStandingsTable = value.standings.first.table;
    return Scaffold(
      backgroundColor: premierBackground,
      appBar: AppBar(
        foregroundColor: premierSecondary,
        backgroundColor: premierPrimary,
        title: LeaugeTitle(competitionName: value.competitionName!),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: BuildImage(url: value.area!.flag!, width: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomExpansionTile(
              title: 'Competition Info',
              icon: Icons.info,
              isOpen: false,
              children: [
                InfoRow(icon: Icons.flag, info: 'Area', data: value.area!.name!),
                InfoRow(icon: Icons.sports_soccer_outlined, info: 'Name', data: value.competitionName!),
                InfoRow(icon: Icons.diversity_2, info: 'Type', data: value.competitionType!),
                InfoRow(
                  icon: Icons.play_circle_fill_outlined,
                  info: 'League Start Date',
                  data: Functions.formatLeagueDate(value.season!.startDate!),
                ),
                InfoRow(
                  icon: Icons.pause_circle_outlined,
                  info: 'League End Date',
                  data: Functions.formatLeagueDate(value.season!.endDate!),
                ),
              ],
            ),
            TileButton(
              icon: Icons.stadium,
              title: 'Fixture',
              onTap: () => AutoRouter.of(context).push(
                LeagueMatchesRoute(
                  leagueCode: value.competitionCode!,
                  currentMatchDay: value.currentMatchDay.toString(),
                ),
              ),
            ),
            TileButton(
              icon: Icons.person,
              title: 'Player Stats',
              onTap: () => AutoRouter.of(context).push(
                PlayerStatsRoute(leagueCode: value.competitionCode!, leagueTitle: value.competitionName!),
              ),
            ),
            CustomExpansionTile(
              title: 'Standings',
              icon: Icons.format_list_bulleted,
              isOpen: true,
              children: [
                LeagueStandings(leagueStandingsTable, value.competitionName!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CupView extends StatelessWidget {
  final StandingsProvider value;

  const CupView({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final cupStandings = value.standings;
    return Scaffold(
      backgroundColor: premierBackground,
      appBar: AppBar(
        foregroundColor: premierSecondary,
        backgroundColor: premierPrimary,
        title: LeaugeTitle(competitionName: value.competitionName!),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Group Standings'),
                Tab(text: 'Competition Info'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TabBarView(
                children: [
                  CupStandings(cupStandings),
                  Column(
                    children: [
                      CustomExpansionTile(
                        title: 'Competition Info',
                        icon: Icons.info,
                        isOpen: false,
                        children: [
                          InfoRow(icon: Icons.flag, info: 'Area', data: value.area!.name!),
                          InfoRow(icon: Icons.sports_soccer_outlined, info: 'Name', data: value.competitionName!),
                          InfoRow(icon: Icons.diversity_2, info: 'Type', data: value.competitionType!),
                          InfoRow(
                            icon: Icons.play_circle_fill_outlined,
                            info: 'League Start Date',
                            data: Functions.formatLeagueDate(value.season!.startDate!),
                          ),
                          InfoRow(
                            icon: Icons.pause_circle_outlined,
                            info: 'League End Date',
                            data: Functions.formatLeagueDate(value.season!.endDate!),
                          ),
                        ],
                      ),
                      TileButton(
                        icon: Icons.stadium,
                        title: 'Fixture',
                        onTap: () => AutoRouter.of(context).push(
                          LeagueMatchesRoute(
                              leagueCode: value.competitionCode!, currentMatchDay: value.currentMatchDay.toString()),
                        ),
                      ),
                      TileButton(
                        icon: Icons.person,
                        title: 'Player Stats',
                        onTap: () => AutoRouter.of(context).push(
                          PlayerStatsRoute(leagueCode: value.competitionCode!, leagueTitle: value.competitionName!),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const TileButton({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        tileColor: premierPrimary,
        iconColor: premierSecondary,
        textColor: premierSecondary,
        titleTextStyle: Styles.headingTextStyle(),
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_right),
        onTap: onTap,
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String info;
  final String data;

  const InfoRow({super.key, required this.icon, required this.info, required this.data});

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

class LeaugeTitle extends StatelessWidget {
  const LeaugeTitle({super.key, required this.competitionName});

  final String competitionName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        competitionName,
        style: const TextStyle(
          color: premierSecondary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
