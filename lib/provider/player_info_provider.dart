import 'package:flutter/material.dart';
import 'package:score_zone/model/player.dart';
import 'package:score_zone/services/api_service.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/utils/functions.dart';

class PlayerInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool isLoading = false;
  String? errorMessage;
  int currentLimit = 10;

  // Match Status don't required, all matches status are consists of finished matches

  Player? _player;
  String? _fullName;
  String? _playerAge;
  String? _playerBirth;
  String? _contractStart;
  String? _contractUntil;
  List<Match>? _playerMatches = [];
  // List<Match>? _finishedMatches = [];
  // List<Match>? _timedMatches = [];
  // List<Match>? _upcomingMatches = [];

  Player? get player => _player;
  String? get fullName => _fullName;
  String? get playerAge => _playerAge;
  String? get playerBirth => _playerBirth;
  String? get contractStart => _contractStart;
  String? get contractUntil => _contractUntil;
  List<Match>? get playerMatches => _playerMatches;
  // List<Match>? get finishedMatches => _finishedMatches;
  // List<Match>? get timedMatches => _timedMatches;
  // List<Match>? get upcomingMatches => _upcomingMatches;

  PlayerInfoProvider(this._apiService);

  Future<void> fetchPlayerInfo(String playerId) async {
    isLoading = true;
    notifyListeners();
    final playerResponse = await _apiService.fetchPlayer(playerId);
    final playerMatchesResponse = await _apiService.fetchPlayerMatches(playerId, currentLimit);
    try {
      _player = playerResponse;
      _playerMatches = playerMatchesResponse.matches;
      // _finishedMatches = _playerMatches!.where((match) => match.status == 'FINISHED').toList();
      // _timedMatches = _playerMatches!.where((match) => match.status == 'TIMED').toList();
      // _upcomingMatches = _playerMatches!.where((match) => match.status == 'SCHEDULED').toList();
      _fullName = '${_player!.firstName} ${_player!.lastName}';
      _playerAge = Functions.calculateAge(_player!.dateOfBirth).toString();
      _playerBirth = Functions.formatLeagueDate(_player!.dateOfBirth!);
      _contractStart = Functions.formatDate(_player!.currentTeam.contract!.start!);
      _contractUntil = Functions.formatDate(_player!.currentTeam.contract!.until!);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to fetch player: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
