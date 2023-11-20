// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:score_zone/presentation/screens/standings_screen.dart' as _i1;
import 'package:score_zone/presentation/screens/league_screen.dart' as _i2;
import 'package:score_zone/presentation/screens/player_stats_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    FixtureRoute.name: (routeData) {
      final args = routeData.argsAs<FixtureRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.StandingsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
        ),
      );
    },
    LeagueRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeagueScreen(),
      );
    },
    PlayerStatsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PlayerStatsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.StandingsScreen]
class FixtureRoute extends _i4.PageRouteInfo<FixtureRouteArgs> {
  FixtureRoute({
    _i5.Key? key,
    required String leagueCode,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          FixtureRoute.name,
          args: FixtureRouteArgs(
            key: key,
            leagueCode: leagueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'FixtureRoute';

  static const _i4.PageInfo<FixtureRouteArgs> page =
      _i4.PageInfo<FixtureRouteArgs>(name);
}

class FixtureRouteArgs {
  const FixtureRouteArgs({
    this.key,
    required this.leagueCode,
  });

  final _i5.Key? key;

  final String leagueCode;

  @override
  String toString() {
    return 'FixtureRouteArgs{key: $key, leagueCode: $leagueCode}';
  }
}

/// generated route for
/// [_i2.LeagueScreen]
class LeagueRoute extends _i4.PageRouteInfo<void> {
  const LeagueRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LeagueRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeagueRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PlayerStatsScreen]
class PlayerStatsRoute extends _i4.PageRouteInfo<void> {
  const PlayerStatsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PlayerStatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerStatsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
