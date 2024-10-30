import 'package:flutter/material.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/presentation/components/league_standings.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/icons.dart';

import 'competition_info.dart';

class LeagueView extends StatelessWidget {
  final StandingsProvider value;

  const LeagueView({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final leagueStandingsTable = value.standings.first.table;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: secondaryText,
        backgroundColor: primaryText,
        title: Center(child: Text(value.competitionName!)),
        titleTextStyle: const TextStyle(color: secondaryText, fontWeight: FontWeight.w700, fontSize: 18),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: BuildImage(url: value.area!.flag!, width: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CompetitionInfo(value: value),
            CustomExpansionTile(
              title: 'Standings',
              icon: AppIcons.standingsIcon,
              isOpen: true,
              primaryColor: primaryText,
              secondaryColor: secondaryText,
              children: [
                LeagueStandings(leagueStandingsTable, value.competitionName!),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}