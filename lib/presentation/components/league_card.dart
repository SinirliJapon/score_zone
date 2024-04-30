import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/presentation/components/build_image.dart';

class LeagueCard extends StatelessWidget {
  final Competition competition;

  const LeagueCard(this.competition, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(StandingsRoute(leagueCode: competition.code!)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BuildImage(url: competition.emblem!, width: 120),
          ),
        ),
      ),
    );
  }
}
