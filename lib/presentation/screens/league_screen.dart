import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/league%20screen/info_button.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/presentation/components/league%20screen/league_card.dart';
import 'package:score_zone/provider/competition_provider.dart';

@RoutePage()
class LeagueScreen extends StatelessWidget {
  const LeagueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CompetitionProvider>(context, listen: false).getCompetitions();
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: leagueScreenColor,
        foregroundColor: primaryText,
        title: const Text('SCORE ZONE'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: 75.0, child: Image.asset('assets/images/logo.png', fit: BoxFit.contain)),
        ),
        titleTextStyle: const TextStyle(
          color: primaryText,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          textBaseline: TextBaseline.ideographic,
          overflow: TextOverflow.ellipsis,
          fontSize: 24,
          letterSpacing: 1.2,
        ),
        actions: const [InfoButton()],
      ),
      backgroundColor: leagueScreenColor,
      body: Consumer<CompetitionProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.competitions.isEmpty) {
            return const Center(child: Text('No competitions available...'));
          } else {
            return GridView.builder(
                itemCount: value.competitions.length,
                itemBuilder: (context, index) {
                  final competition = value.competitions[index];
                  return LeagueCard(competition);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
          }
        },
      ),
    );
  }
}
