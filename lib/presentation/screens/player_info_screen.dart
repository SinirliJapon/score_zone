import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_expansion_tile.dart';
import 'package:score_zone/presentation/components/custom_info_row.dart';
import 'package:score_zone/presentation/components/match_list.dart';
import 'package:score_zone/provider/player_info_provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/icons.dart';

@RoutePage()
class PlayerInfoScreen extends StatelessWidget {
  final String leagueCode;
  final String playerId;

  const PlayerInfoScreen({Key? key, required this.leagueCode, required this.playerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlayerInfoProvider>(context, listen: false).fetchPlayerInfo(playerId);
    });

    return Consumer<PlayerInfoProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.errorMessage != null) {
        return Center(child: Text(value.errorMessage!));
      } else if (value.player == null) {
        return const Center(child: Text('No player info available...'));
      } else {
        final player = value.player!;
        final team = value.player!.currentTeam;
        final matches = value.playerMatches!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: teamInfoScreenColor,
            foregroundColor: primaryText,
            title: Text(player.name!),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: BuildImage(url: team.area.flag!, width: 30),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomExpansionTile(
                  title: 'Player Info',
                  icon: AppIcons.playerInfoIcon,
                  isOpen: true,
                  primaryColor: teamInfoScreenColor,
                  secondaryColor: primaryText,
                  children: [
                    CustomInfoRow(icon: AppIcons.playerTeamIcon, info: 'Player Team', data: player.currentTeam.name!),
                    CustomInfoRow(icon: AppIcons.playerShirtNumberIcon, info: 'Shirt Number', data: player.shirtNumber.toString()),
                    CustomInfoRow(icon: AppIcons.playerPositionIcon, info: 'Posititon', data: player.position!),
                    CustomInfoRow(icon: AppIcons.dateOfBirthIcon, info: 'Date of Birth', data: value.playerBirth!),
                    CustomInfoRow(icon: AppIcons.playerAgeIcon, info: 'Age', data: value.playerAge!),
                    CustomInfoRow(icon: AppIcons.nationalityIcon, info: 'Nationality', data: player.nationality!),
                    CustomInfoRow(icon: AppIcons.startIcon, info: 'Contract Start', data: value.contractStart!),
                    CustomInfoRow(icon: AppIcons.endIcon, info: 'Contract Until', data: value.contractUntil!),
                  ],
                ),
                CustomExpansionTile(
                  isOpen: true,
                  icon: AppIcons.finishedMatchesIcon,
                  title: "Player Matches",
                  primaryColor: teamInfoScreenColor,
                  secondaryColor: primaryText,
                  children: [
                    MatchList(matches: matches, isFinished: true),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
