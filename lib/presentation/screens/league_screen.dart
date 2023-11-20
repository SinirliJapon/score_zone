import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/presentation/components/league_card.dart';
import 'package:score_zone/provider/competition_provider.dart';

@RoutePage()
class LeagueScreen extends StatefulWidget {
  const LeagueScreen({Key? key}) : super(key: key);

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  final List<String> excludedLeagues = ['EC'];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<CompetitionProvider>(context, listen: false)
          .getCompetitions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: leagueScreenColor,
      body: Consumer<CompetitionProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.competitions.isEmpty) {
            return const Center(child: Text('No competitions available'));
          } else {
            final filteredCompetitions = value.competitions
                .where((competition) =>
                    !excludedLeagues.contains(competition.code))
                .toList();
            return GridView.builder(
                itemCount: filteredCompetitions.length,
                itemBuilder: (context, index) {
                  final competition = filteredCompetitions[index];
                  return LeagueCard(competition);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2));
          }
        },
      ),
    );
  }
}
