import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/model/competitions.dart';

class LeagueCard extends StatelessWidget {
  final Competitions competition;

  const LeagueCard(this.competition, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(FixtureRoute(leagueCode: competition.code)),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: competition.emblem.endsWith(".svg")
                ? Column(
                    children: [
                      const Icon(Icons.sports_soccer_outlined, size: 80),
                      const SizedBox(height: 20),
                      Text(competition.name.toString()),
                    ],
                  )
                : Image.network(
                    competition.emblem,
                    height: 120,
                  ),
          ),
        ),
      ),
    );
  }
}
