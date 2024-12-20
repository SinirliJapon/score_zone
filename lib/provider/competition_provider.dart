import 'package:flutter/foundation.dart';
import 'package:score_zone/model/competition.dart';
import 'package:score_zone/services/api_service.dart';

class CompetitionProvider extends ChangeNotifier {
  final ApiService _apiService;

  CompetitionProvider(this._apiService);

  List<Competition> _competitions = [];
  List<Competition> get competitions => _competitions;

  late bool isLoading = false;

  Future<void> getCompetitions() async {
    isLoading = true;
    notifyListeners();

    try {
      final competitionResponse = await _apiService.fetchCompetitions();
      _competitions = competitionResponse.competitions;
    } catch (e) {
      throw Exception('Failed to fetch competitions: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
