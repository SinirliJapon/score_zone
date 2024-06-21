import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/provider/player_info_provider.dart';
import 'package:score_zone/utils/colors.dart';

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
        return Scaffold(
          backgroundColor: leagueColors[leagueCode] ?? Colors.grey,
          appBar: AppBar(
            foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            title: Text(value.player!.name!),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(),
          ),
        );
      }
    });
  }
}


