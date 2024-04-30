// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:score_zone/presentation/screens/league_screen.dart' as _i1;
import 'package:score_zone/presentation/screens/player_stats_screen.dart'
    as _i2;
import 'package:score_zone/presentation/screens/standings_screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LeagueRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LeagueScreen(),
      );
    },
    PlayerStatsRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerStatsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.PlayerStatsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
          leagueTitle: args.leagueTitle,
        ),
      );
    },
    StandingsRoute.name: (routeData) {
      final args = routeData.argsAs<StandingsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.StandingsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LeagueScreen]
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
/// [_i2.PlayerStatsScreen]
class PlayerStatsRoute extends _i4.PageRouteInfo<PlayerStatsRouteArgs> {
  PlayerStatsRoute({
    _i5.Key? key,
    required String leagueCode,
    required String leagueTitle,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PlayerStatsRoute.name,
          args: PlayerStatsRouteArgs(
            key: key,
            leagueCode: leagueCode,
            leagueTitle: leagueTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerStatsRoute';

  static const _i4.PageInfo<PlayerStatsRouteArgs> page =
      _i4.PageInfo<PlayerStatsRouteArgs>(name);
}

class PlayerStatsRouteArgs {
  const PlayerStatsRouteArgs({
    this.key,
    required this.leagueCode,
    required this.leagueTitle,
  });

  final _i5.Key? key;

  final String leagueCode;

  final String leagueTitle;

  @override
  String toString() {
    return 'PlayerStatsRouteArgs{key: $key, leagueCode: $leagueCode, leagueTitle: $leagueTitle}';
  }
}

/// generated route for
/// [_i3.StandingsScreen]
class StandingsRoute extends _i4.PageRouteInfo<StandingsRouteArgs> {
  StandingsRoute({
    _i5.Key? key,
    required String leagueCode,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          StandingsRoute.name,
          args: StandingsRouteArgs(
            key: key,
            leagueCode: leagueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'StandingsRoute';

  static const _i4.PageInfo<StandingsRouteArgs> page =
      _i4.PageInfo<StandingsRouteArgs>(name);
}

class StandingsRouteArgs {
  const StandingsRouteArgs({
    this.key,
    required this.leagueCode,
  });

  final _i5.Key? key;

  final String leagueCode;

  @override
  String toString() {
    return 'StandingsRouteArgs{key: $key, leagueCode: $leagueCode}';
  }
}
