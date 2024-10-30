import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/presentation/components/custom_info_row.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/icons.dart';
import 'package:score_zone/utils/styles.dart';

class CompetitionInfo extends StatelessWidget {
  final StandingsProvider value;

  const CompetitionInfo({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomExpansionTile(
          title: 'Competition Info',
          icon: Icons.info,
          isOpen: false,
          primaryColor: primaryText,
          secondaryColor: secondaryText,
          children: [
            Center(child: BuildImage(url: value.competitionEmblem!, width: 200)),
            CustomInfoRow(icon: AppIcons.competitionAreaIcon, info: 'Area', data: value.area!.name!),
            CustomInfoRow(icon: AppIcons.competitionNameIcon, info: 'Name', data: value.competitionName!),
            CustomInfoRow(icon: AppIcons.competitionTypeIcon, info: 'Type', data: value.competitionType!),
            CustomInfoRow(icon: AppIcons.startIcon, info: 'League Start Date', data: value.competitionStartDate!),
            CustomInfoRow(icon: AppIcons.endIcon, info: 'League End Date', data: value.competitionEndDate!),
          ],
        ),
        Row(
          children: [
            TileButton(
              icon: AppIcons.fixtureIcon,
              title: 'Fixture',
              onTap: () => AutoRouter.of(context).push(
                LeagueMatchesRoute(
                  leagueCode: value.competitionCode!,
                  currentMatchDay: value.currentMatchDay.toString(),
                ),
              ),
            ),
            TileButton(
              icon: AppIcons.playerStatsIcon,
              title: 'Player Stats',
              onTap: () => AutoRouter.of(context).push(
                PlayerStatsRoute(
                  leagueCode: value.competitionCode!,
                  leagueTitle: value.competitionName!,
                ),
              ),
            ),
          ],
        ),
      ],
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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: primaryText,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Row(
              children: [
                Icon(icon, color: secondaryText),
                const SizedBox(width: 16),
                Expanded(child: Text(title, style: Styles.headingTextStyle())),
                const Icon(Icons.arrow_right, color: secondaryText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
