import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/presentation/components/league_card.dart';
import 'package:score_zone/provider/competition_provider.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/icons.dart';

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
        backgroundColor: leagueScreenColor,
        foregroundColor: primaryText,
        title: const Text('Score Zone'),
        titleTextStyle: const TextStyle(color: primaryText, fontWeight: FontWeight.bold, fontSize: 24),
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

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(AppIcons.appInfoIcon),
        onPressed: () {
          String title = 'Welcome to Score Zone';
          String details =
              'Access the data of the popular leagues and cups in the world.\nSome data can be outdated or incomplete because of the free plan.\n';
          Functions.showPopup(context, title, details);
        });
  }
}


