// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:score_zone/presentation/screens/league_matches_screen.dart'
    as _i1;
import 'package:score_zone/presentation/screens/league_screen.dart' as _i2;
import 'package:score_zone/presentation/screens/player_info_screen.dart' as _i3;
import 'package:score_zone/presentation/screens/player_stats_screen.dart'
    as _i4;
import 'package:score_zone/presentation/screens/standings_screen.dart' as _i5;
import 'package:score_zone/presentation/screens/team_info_screen.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LeagueMatchesRoute.name: (routeData) {
      final args = routeData.argsAs<LeagueMatchesRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.LeagueMatchesScreen(
          key: args.key,
          leagueCode: args.leagueCode,
          currentMatchDay: args.currentMatchDay,
        ),
      );
    },
    LeagueRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeagueScreen(),
      );
    },
    PlayerInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerInfoRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PlayerInfoScreen(
          key: args.key,
          leagueCode: args.leagueCode,
          playerId: args.playerId,
        ),
      );
    },
    PlayerStatsRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerStatsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PlayerStatsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
          leagueTitle: args.leagueTitle,
        ),
      );
    },
    StandingsRoute.name: (routeData) {
      final args = routeData.argsAs<StandingsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.StandingsScreen(
          key: args.key,
          leagueCode: args.leagueCode,
        ),
      );
    },
    TeamInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TeamInfoRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.TeamInfoScreen(
          key: args.key,
          leagueName: args.leagueName,
          teamId: args.teamId,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.LeagueMatchesScreen]
class LeagueMatchesRoute extends _i7.PageRouteInfo<LeagueMatchesRouteArgs> {
  LeagueMatchesRoute({
    _i8.Key? key,
    required String leagueCode,
    required String currentMatchDay,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LeagueMatchesRoute.name,
          args: LeagueMatchesRouteArgs(
            key: key,
            leagueCode: leagueCode,
            currentMatchDay: currentMatchDay,
          ),
          initialChildren: children,
        );

  static const String name = 'LeagueMatchesRoute';

  static const _i7.PageInfo<LeagueMatchesRouteArgs> page =
      _i7.PageInfo<LeagueMatchesRouteArgs>(name);
}

class LeagueMatchesRouteArgs {
  const LeagueMatchesRouteArgs({
    this.key,
    required this.leagueCode,
    required this.currentMatchDay,
  });

  final _i8.Key? key;

  final String leagueCode;

  final String currentMatchDay;

  @override
  String toString() {
    return 'LeagueMatchesRouteArgs{key: $key, leagueCode: $leagueCode, currentMatchDay: $currentMatchDay}';
  }
}

/// generated route for
/// [_i2.LeagueScreen]
class LeagueRoute extends _i7.PageRouteInfo<void> {
  const LeagueRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LeagueRoute.name,
          initialChildren: children,
        );

  static const String name = 'LeagueRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PlayerInfoScreen]
class PlayerInfoRoute extends _i7.PageRouteInfo<PlayerInfoRouteArgs> {
  PlayerInfoRoute({
    _i8.Key? key,
    required String leagueCode,
    required String playerId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PlayerInfoRoute.name,
          args: PlayerInfoRouteArgs(
            key: key,
            leagueCode: leagueCode,
            playerId: playerId,
          ),
          initialChildren: children,
        );

  static const String name = 'PlayerInfoRoute';

  static const _i7.PageInfo<PlayerInfoRouteArgs> page =
      _i7.PageInfo<PlayerInfoRouteArgs>(name);
}

class PlayerInfoRouteArgs {
  const PlayerInfoRouteArgs({
    this.key,
    required this.leagueCode,
    required this.playerId,
  });

  final _i8.Key? key;

  final String leagueCode;

  final String playerId;

  @override
  String toString() {
    return 'PlayerInfoRouteArgs{key: $key, leagueCode: $leagueCode, playerId: $playerId}';
  }
}

/// generated route for
/// [_i4.PlayerStatsScreen]
class PlayerStatsRoute extends _i7.PageRouteInfo<PlayerStatsRouteArgs> {
  PlayerStatsRoute({
    _i8.Key? key,
    required String leagueCode,
    required String leagueTitle,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<PlayerStatsRouteArgs> page =
      _i7.PageInfo<PlayerStatsRouteArgs>(name);
}

class PlayerStatsRouteArgs {
  const PlayerStatsRouteArgs({
    this.key,
    required this.leagueCode,
    required this.leagueTitle,
  });

  final _i8.Key? key;

  final String leagueCode;

  final String leagueTitle;

  @override
  String toString() {
    return 'PlayerStatsRouteArgs{key: $key, leagueCode: $leagueCode, leagueTitle: $leagueTitle}';
  }
}

/// generated route for
/// [_i5.StandingsScreen]
class StandingsRoute extends _i7.PageRouteInfo<StandingsRouteArgs> {
  StandingsRoute({
    _i8.Key? key,
    required String leagueCode,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          StandingsRoute.name,
          args: StandingsRouteArgs(
            key: key,
            leagueCode: leagueCode,
          ),
          initialChildren: children,
        );

  static const String name = 'StandingsRoute';

  static const _i7.PageInfo<StandingsRouteArgs> page =
      _i7.PageInfo<StandingsRouteArgs>(name);
}

class StandingsRouteArgs {
  const StandingsRouteArgs({
    this.key,
    required this.leagueCode,
  });

  final _i8.Key? key;

  final String leagueCode;

  @override
  String toString() {
    return 'StandingsRouteArgs{key: $key, leagueCode: $leagueCode}';
  }
}

/// generated route for
/// [_i6.TeamInfoScreen]
class TeamInfoRoute extends _i7.PageRouteInfo<TeamInfoRouteArgs> {
  TeamInfoRoute({
    _i8.Key? key,
    required String leagueName,
    required String teamId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          TeamInfoRoute.name,
          args: TeamInfoRouteArgs(
            key: key,
            leagueName: leagueName,
            teamId: teamId,
          ),
          initialChildren: children,
        );

  static const String name = 'TeamInfoRoute';

  static const _i7.PageInfo<TeamInfoRouteArgs> page =
      _i7.PageInfo<TeamInfoRouteArgs>(name);
}

class TeamInfoRouteArgs {
  const TeamInfoRouteArgs({
    this.key,
    required this.leagueName,
    required this.teamId,
  });

  final _i8.Key? key;

  final String leagueName;

  final String teamId;

  @override
  String toString() {
    return 'TeamInfoRouteArgs{key: $key, leagueName: $leagueName, teamId: $teamId}';
  }
}
