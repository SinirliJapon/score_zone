import 'package:auto_route/auto_route.dart';
import 'package:score_zone/app_router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LeagueRoute.page, initial: true),
        AutoRoute(page: FixtureRoute.page),
        AutoRoute(page: PlayerStatsRoute.page),
      ];
}
