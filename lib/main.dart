import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/app_router/app_router.dart';
import 'package:score_zone/provider/competition_provider.dart';
import 'package:score_zone/provider/league_matches_provider.dart';
import 'package:score_zone/provider/player_info_provider.dart';
import 'package:score_zone/provider/player_stats_provider.dart';
import 'package:score_zone/provider/score_opacity_provider.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/provider/team_info_provider.dart';
import 'package:score_zone/services/api_service.dart';

void main() async {
  await dotenv.load();
  final apiKey = dotenv.env['API_KEY'];
  final dio = Dio(BaseOptions(headers: {"X-Auth-Token": apiKey}));
  final apiService = ApiService(dio);
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>.value(value: dio),
        ChangeNotifierProvider(create: (context) => CompetitionProvider(apiService)),
        ChangeNotifierProvider(create: (context) => StandingsProvider(apiService)),
        ChangeNotifierProvider(create: (context) => PlayerStatsProvider(apiService)),
        ChangeNotifierProvider(create: (context) => LeagueMatchesProvider(apiService)),
        ChangeNotifierProvider(create: (context) => ScoreOpacityProvider()),
        ChangeNotifierProvider(create: (context) => TeamInfoProvider(apiService)),
        ChangeNotifierProvider(create: (context) => PlayerInfoProvider(apiService))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(routerConfig: appRouter.config());
  }
}
