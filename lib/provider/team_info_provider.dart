import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/model/coach.dart';
import 'package:score_zone/model/player.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/model/team.dart';
import 'package:score_zone/services/api_service.dart';
import 'package:score_zone/utils/functions.dart';

class TeamInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool isLoading = false;
  int currentLimit = 100;
  String matchStatus = 'SCHEDULED';

  Team? _team;
  Coach? _coach;
  int? _squadSize;
  String? _averageAge;
  String? errorMessage;
  String? _coachAge;
  String? _coachBirth;
  String? _coachStart;
  String? _coachUntil;
  List<Match>? _teamMatches = [];
  List<Match>? _finishedMatches = [];
  List<Match>? _timedMatches = [];
  List<Match>? _upcomingMatches = [];
  List<Player>? _teamSquad = [];

  int? get squadSize => _squadSize;
  String? get averageAge => _averageAge;
  String? get coachAge => _coachAge;
  String? get coachBirth => _coachBirth;
  String? get coachStart => _coachStart;
  String? get coachUntil => _coachUntil;
  Team? get team => _team;
  Coach? get coach => _coach;
  List<Match>? get teamMatches => _teamMatches;
  List<Match>? get finishedMatches => _finishedMatches;
  List<Match>? get timedMatches => _timedMatches;
  List<Match>? get upcomingMatches => _upcomingMatches;
  List<Player>? get teamSquad => _teamSquad;

  TeamInfoProvider(this._apiService);

  Future<void> fetchTeamSquad(String teamId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final teamResponse = await _apiService.fetchTeam(teamId);
      final teamMatchResponse = await _apiService.fetchTeamMatches(teamId, currentLimit);
      _team = teamResponse;
      _coach = _team!.coach;
      _teamMatches = teamMatchResponse.matches;
      _finishedMatches = teamMatches!.where((match) => match.status == 'FINISHED').toList();
      _timedMatches = teamMatches!.where((match) => match.status == 'TIMED').toList();
      _upcomingMatches = teamMatches!.where((match) => match.status == 'SCHEDULED').toList();
      if (teamResponse.squad != null && teamResponse.squad!.isNotEmpty) {
        _teamSquad = _team!.squad;
        _squadSize = _teamSquad!.length;
        List<int> ages = _teamSquad!.map((player) => int.parse(Functions.calculateAge(player.dateOfBirth).toString())).toList();
        double averageAgeValue = ages.reduce((a, b) => a + b) / _squadSize!;
        _averageAge = averageAgeValue.toStringAsFixed(1);
        _coachAge = Functions.calculateAge(_coach!.dateOfBirth).toString();
        _coachBirth = Functions.formatLeagueDate(_coach!.dateOfBirth!);
        _coachStart = Functions.formatDate(_coach!.contract.start!);
        _coachUntil = Functions.formatDate(_coach!.contract.until!);
        errorMessage = null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        errorMessage = "Error: ${e.response!.statusCode}";
      } else {
        errorMessage = "Error: ${e.message}";
      }
      _teamSquad = null;
    } catch (e) {
      errorMessage = 'Failed to fetch squad: $e';
      _teamSquad = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> toggleMatchStatus(String teamId) async {
  //   matchStatus = matchStatus == 'SCHEDULED' ? 'FINISHED' : 'SCHEDULED';
  //   await fetchTeamMatches(teamId);
  // }

  // Future<void> fetchTeamMatches(String teamId) async {
  //   isLoading = true;
  //   errorMessage = null;
  //   notifyListeners();

  //   try {
  //     final teamMatchResponse = await _apiService.fetchTeamMatches(teamId, matchStatus, currentLimit);
  //     _teamMatches = teamMatchResponse.matches;
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       errorMessage = "Error: ${e.response!.statusCode}";
  //     } else {
  //       errorMessage = "Error: ${e.message}";
  //     }
  //     _teamMatches = null;
  //   } catch (e) {
  //     errorMessage = 'Failed to fetch team matches: $e';
  //     _teamMatches = null;
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  void changeLimit() {
    // The function for changing the team matches limit
    // In free subscription not make sense to use
    // It could be used for player info provider
    currentLimit = limitChanger(currentLimit);
    notifyListeners();
  }
}

int limitChanger(int currentLimit) {
  List<int> limits = [10, 15, 20];
  int currentIndex = limits.indexOf(currentLimit);
  int nextIndex = (currentIndex + 1) % limits.length;
  return limits[nextIndex];
}
