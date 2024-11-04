import 'package:auto_route/auto_route.dart';
import 'package:score_zone/app_router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LeagueRoute.page, initial: true),
        AutoRoute(page: StandingsRoute.page),
        AutoRoute(page: PlayerStatsRoute.page),
        AutoRoute(page: LeagueMatchesRoute.page),
        AutoRoute(page: TeamInfoRoute.page),
        AutoRoute(page: PlayerInfoRoute.page)
      ];
}

// This can be add the animations to the routes

// customAppRoute(PageInfo<dynamic> page, bool initial) {
//   return CustomRoute(
//     page: page,
//     initial: initial,
//     maintainState: true,
//     keepHistory: true,
//     transitionsBuilder: TransitionsBuilders.slideLeft,
//     durationInMilliseconds: 400,
//     reverseDurationInMilliseconds: 400,
//   );
// }