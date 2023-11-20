import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/app_router/app_router.dart';
import 'package:score_zone/provider/competition_provider.dart';
import 'package:score_zone/provider/standings_provider.dart';
import 'package:score_zone/services/api_service.dart';

void main() {
  final dio = Dio(BaseOptions(headers: {"X-Auth-Token": "d6cc355ca3de45da92628ae7b7dbdef7"}));
  final apiService = ApiService(dio);
  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>.value(value: dio),
        ChangeNotifierProvider(create: (context) => CompetitionProvider(apiService)),
        ChangeNotifierProvider(create: (context) => StandingsProvider(apiService)),
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
