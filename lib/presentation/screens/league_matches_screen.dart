import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/match_list.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/presentation/components/custom_match_day_picker.dart';
import 'package:score_zone/provider/league_matches_provider.dart';

@RoutePage()
class LeagueMatchesScreen extends StatelessWidget {
  final String currentMatchDay;
  final String leagueCode;
  const LeagueMatchesScreen({Key? key, required this.leagueCode, required this.currentMatchDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LeagueMatchesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchMatchesForCurrentMatchday(leagueCode, currentMatchDay);
    });
    return Consumer<LeagueMatchesProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.desiredMatches.isEmpty) {
          return const Center(child: Text('No league matches available...'));
        } else {
          final matches = value.desiredMatches.toList();
          return Scaffold(
            backgroundColor: matchesScreenColor,
            appBar: AppBar(
              foregroundColor: primaryText,
              backgroundColor: matchesScreenColor,
              title: const Text('League Match Day:'),
              actions: [
                CustomMatchDayPicker(value: value, leagueCode: leagueCode, totalMatchDays: value.totalMatchDay),
              ],
            ),
            body: MatchList(matches: matches, isScroll: true),
          );
        }
      },
    );
  }
}

