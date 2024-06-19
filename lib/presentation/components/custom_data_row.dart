import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/presentation/components/build_image.dart';

class CustomDataRow extends StatelessWidget {
  const CustomDataRow({
    super.key,
    required this.leagueCode,
    required this.teamId,
    required this.teamCrest,
    required this.teamTla,
  });

  final String leagueCode;
  final String teamId;
  final String teamCrest;
  final String teamTla;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(TeamInfoRoute(teamId: teamId, leagueCode: leagueCode)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BuildImage(url: teamCrest),
          const SizedBox(width: 5),
          Text(teamTla, style: const TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}