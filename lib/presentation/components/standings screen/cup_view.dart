import 'package:flutter/material.dart';
import 'package:score_zone/presentation/components/standings%20screen/cup_standings.dart';
import 'package:score_zone/presentation/components/standings%20screen/competition_info.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/utils/colors.dart';

class CupView extends StatelessWidget {
  final StandingsProvider value;

  const CupView({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final cupStandings = value.standings;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: secondaryText,
        backgroundColor: primaryText,
        title: Center(child: Text(value.competitionName!)),
        titleTextStyle: const TextStyle(color: secondaryText, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CompetitionInfo(value: value),
            CupStandings(cupStandings),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}