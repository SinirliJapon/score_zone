// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:score_zone/presentation/screens/league_matches_screen.dart'
    as _i1;
import 'package:score_zone/presentation/screens/league_screen.dart' as _i2;
import 'package:score_zone/presentation/screens/player_stats_screen.dart'
    as _i3;
import 'package:score_zone/presentation/screens/standings_screen.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LeagueMatchesRoute.name: (routeData) {
      final args = routeData.argsAs<LeagueMatchesRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LeagueMatchesScreen(
          key: args.key,
          leagueCode: args.leagueCode,
        ),
      );
    },
    LeagueRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeagueScreen(),
      );
    },
    PlayerStatsRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerStatsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PlayerStatsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
          leagueTitle: args.leagueTitle,
        ),
      );
    },
    StandingsRoute.name: (routeData) {
      final args = routeData.argsAs<StandingsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.StandingsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LeagueMatchesScreen]
class LeagueMatchesRoute extends _i5.PageRouteInfo<LeagueMatchesRouteArgs> {
  LeagueMatchesRoute({
    _i6.Key? key,
    required String leagueCode,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LeagueMatchesRoute.name,
          args: LeagueMatchesRouteArgs(
            key: key,
            leagueCode: leagueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'LeagueMatchesRoute';

  static const _i5.PageInfo<LeagueMatchesRouteArgs> page =
      _i5.PageInfo<LeagueMatchesRouteArgs>(name);
}

class LeagueMatchesRouteArgs {
  const LeagueMatchesRouteArgs({
    this.key,
    required this.leagueCode,
  });

  final _i6.Key? key;

  final String leagueCode;

  @override
  String toString() {
    return 'LeagueMatchesRouteArgs{key: $key, leagueCode: $leagueCode}';
  }
}

/// generated route for
/// [_i2.LeagueScreen]
class LeagueRoute extends _i5.PageRouteInfo<void> {
  const LeagueRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LeagueRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeagueRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PlayerStatsScreen]
class PlayerStatsRoute extends _i5.PageRouteInfo<PlayerStatsRouteArgs> {
  PlayerStatsRoute({
    _i6.Key? key,
    required String leagueCode,
    required String leagueTitle,
    List<_i5.PageRouteInfo>? children,
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

  static const _i5.PageInfo<PlayerStatsRouteArgs> page =
      _i5.PageInfo<PlayerStatsRouteArgs>(name);
}

class PlayerStatsRouteArgs {
  const PlayerStatsRouteArgs({
    this.key,
    required this.leagueCode,
    required this.leagueTitle,
  });

  final _i6.Key? key;

  final String leagueCode;

  final String leagueTitle;

  @override
  String toString() {
    return 'PlayerStatsRouteArgs{key: $key, leagueCode: $leagueCode, leagueTitle: $leagueTitle}';
  }
}

/// generated route for
/// [_i4.StandingsScreen]
class StandingsRoute extends _i5.PageRouteInfo<StandingsRouteArgs> {
  StandingsRoute({
    _i6.Key? key,
    required String leagueCode,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          StandingsRoute.name,
          args: StandingsRouteArgs(
            key: key,
            leagueCode: leagueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'StandingsRoute';

  static const _i5.PageInfo<StandingsRouteArgs> page =
      _i5.PageInfo<StandingsRouteArgs>(name);
}

class StandingsRouteArgs {
  const StandingsRouteArgs({
    this.key,
    required this.leagueCode,
  });

  final _i6.Key? key;

  final String leagueCode;

  @override
  String toString() {
    return 'StandingsRouteArgs{key: $key, leagueCode: $leagueCode}';
  }
}
